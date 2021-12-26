(export (import: ../opt) main)
(import :std/foreign :gerbil/gambit/foreign ../opt :gerbil/gambit
        :std/misc/list :std/getopt :std/srfi/1)
(declare (not optimize-dead-definitions))


(def (getopts->fuse tbl)
  (def args [])
  (def mp #f)
  (def opts (table->list tbl))
  (def (opt->lst pair)
    (match pair
      ([key . val]
       (let (optk (symbol->string key))
         (cond ((boolean? val) (if val [optk] []))
               ((list? val)
                (let lp ((v val))
                  (if (null? v) v
                      (cons* optk (car v)
                             (lp (cdr v))))))
               (else [optk val]))))))

  (for-each (lambda (pair)
              (match pair
                ([name . val]
                 (cond
                  ((eq? name '<mountpoint>) (set! mp val))
                  ((eq? name '--name) (set! file-name val))
                  ((eq? name '--contents)
                   (set! file-contents
                     (string->bytes val)))
                  (else (push! (opt->lst pair) args))))))
            opts)

  (when mp (push! [mp] args))

  (set! args (reverse! args))
  (append-map (lambda (a) (if (list? a) a [a])) args))


(def go
  (getopt
   (option '--name "--name"
           help: "Name of the \"hello\" file"
           default: "hello")
   (option '--contents "--contents"
           help: "Contents of the \"hello\" file"
           default: "Hello World!\n")
   (flag '--help "-h" "--help")
   (flag '--version "-V" "--version")
   (flag '-d "-d")
   (flag '-f "-f")
   (flag '-s "-s")
   (option '-o "-o")
   ;;; Not needed for --help
   (optional-argument '<mountpoint>)))

(def (main . args)
  (def go-args (getopt-parse go args))
  (def fargs (getopts->fuse go-args))
  (%main (fuse_args<-list
          [(car ##processed-command-line) fargs ...])))

(begin-ffi (%main fuse_args* gfuse-read
            file-contents file-name)
  (c-declare "#define FUSE_USE_VERSION 31")
  (c-declare "#include <fuse.h>")
  (c-declare "#include <fuse_opt.h>")
  (c-declare "static int gfuse_read(char *, char *, long unsigned int,  int,  struct fuse_file_info *);")
  (c-define
   (gfuse-file-size) ()
   int "gfuse_file_size" ""
   (u8vector-length file-contents))
  (c-define
   (gfuse-file-name) ()
    char-string "gfuse_file_name" "" file-name)
  (c-declare "#include \"gfuse_getopt-hello.c\"")
  (define-c-struct fuse_file_info)
  (c-define
   (gfuse-read path buf size offset fi)
   (char-string (pointer char) size_t int fuse_file_info*)
   int "gfuse_read" "static"
  
   (gfuse-read-bytes file-contents path buf size offset fi))
  (define file-contents (string->bytes "This is a set! string!\n"))
  (define file-name "hello-getopt")
  (define-macro (extern-c-struct name)
    (let ((exists? (assoc name c#c-interface-types)))
      (if exists?
        '(begin)
        `(define-c-struct ,name))))
  (define-c-lambda gfuse-read-bytes
    (scheme-object char-string (pointer char) size_t int fuse_file_info*)
    int
    "
    ___SCMOBJ bytes = ___arg1;
    char *path= ___arg2;
    char *buf = ___arg3;
  	size_t len;
    size_t size = ___arg4;
    int offset = ___arg5;
  
    (void) ___arg6;
  
    char* name = gfuse_file_name();
  
  	if(strcmp(path+1, name) != 0)
  		___return(-ENOENT);
  
  	len = U8_LEN (bytes);
  
  	if (offset < len) {
  		if (offset + size > len)
  			size = len - offset;
  		memcpy(buf, U8_DATA (bytes) + offset, size);
  	} else
  		size = 0;
  
  	___return(size);
      ")
  (extern-c-struct fuse_args)
  (define-c-lambda %main (fuse_args*) int "
int res = _main(___arg1->argc, ___arg1->argv);
___return(res);"))
