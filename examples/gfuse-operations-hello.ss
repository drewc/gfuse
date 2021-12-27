(export (import: ../opt) main)
(import :std/foreign :gerbil/gambit/foreign ../opt :gerbil/gambit
        :std/misc/list :std/getopt :std/srfi/1)
(declare (not optimize-dead-definitions))

(begin-ffi (%main fuse_args* gfuse-read
            file-contents file-name fuse-operations-init
            fuse_config fuse_config* (struct fuse_config kernel_cache)
            current-fuse-operations fuse_fill_dir -ENOENT
            fuse-operations-readdir fuse-operations-read)
(c-declare "#define FUSE_USE_VERSION 31")
(c-declare "#include <fuse.h>")
(c-declare "#include <fuse_opt.h>")

(c-define
 (gfuse-file-size) ()
 int "gfuse_file_size" ""
 (u8vector-length file-contents))

(c-define
 (gfuse-file-name) ()
  char-string "gfuse_file_name" "" file-name)

(c-declare "#include \"gfuse_operations-hello.c\"")

(define file-contents (string->bytes "This is a set! string!\n"))
(define file-name "hello-getopt")
(define-macro (extern-c-struct name)
  (let ((exists? (assoc name c#c-interface-types)))
    (if exists?
      '(begin)
      `(define-c-struct ,name))))

(extern-c-struct fuse_args)

(c-define
 (current_gfuse_operations) ()
  scheme-object "current_gfuse_operations" ""
  (current-fuse-operations))
(c-declare #<<END-C
#ifndef ___HAVE_FFI_NOFREE
#define ___HAVE_FFI_NOFREE
___SCMOBJ ffi_nofree (void *ptr)
{
 return ___FIX (___NO_ERR);
}
#endif
END-C
)
(define-c-struct fuse_conn_info () "ffi_nofree")
(define-c-struct fuse_config ((kernel_cache . int))
  "ffi_nofree")
(c-define
 (gfuse_operations_init gfo conn cfg) (scheme-object fuse_conn_info* fuse_config*)
  void "gfuse_operations_init" "" (fuse-operations-init gfo conn cfg))
(c-define-type fuse_fill_dir_t "fuse_fill_dir_t")
(c-define-type fuse_fill_dir_t* (pointer fuse_fill_dir_t))
(c-define-type stat (struct "stat"))
(c-define-type stat* (pointer stat))
(c-define-type off_t int)
(define-c-struct fuse_file_info () "ffi_nofree")

(define-c-lambda fuse_fill_dir
  (fuse_fill_dir_t (pointer void) char-string stat* off_t int)
  int "
int ret = ___arg1(___arg2, ___arg3, ___arg4, ___arg5, ___arg6);
___return(ret);
")
(define-c-lambda -ENOENT () int "___return(-ENOENT);")
(c-define
 (gfuse_operations_readdir gfo path buff fd off fi flags)
 (scheme-object char-string (pointer void)
                fuse_fill_dir_t off_t fuse_file_info* int)
  int "gfuse_operations_readdir" ""
  (fuse-operations-readdir gfo path buff fd off fi flags))

(c-define
 (gfuse_operations_read gfo path buf size offset fi)
 (scheme-object char-string (pointer char) size_t off_t fuse_file_info*)
 int "gfuse_operations_read" ""
 (fuse-operations-read gfo path buf size offset fi))

(define-c-lambda %main (fuse_args*) int "
int res = _main(___arg1->argc, ___arg1->argv);
___return(res);")

) ;; /begin-ffi


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

(defstruct fuse-operations ())
(set! current-fuse-operations
  (make-parameter (make-fuse-operations)))

(defstruct (hello-fuse-operations fuse-operations) ())
(def hello-oper (make-hello-fuse-operations))
(current-fuse-operations hello-oper)

(defmethod {init fuse-operations}
  (lambda (self conn cf)
    (set! (fuse_config-kernel_cache cf) 1)
    []))

(set! fuse-operations-init
     (lambda (s c f)
      ;; (display "HERE IN INIT FFS")
       {init s c f}))

(defmethod {readdir fuse-operations}
  (lambda (self path buf fd off fi flags)
    (if (not (string=? path "/")) (-ENOENT)
        (begin
          (fuse_fill_dir fd buf "." #f 0 0)
          (fuse_fill_dir fd buf ".." #f 0 0)
          0))))

(set! fuse-operations-readdir
  (lambda (self p b f o fi fl) {readdir self p b f o fi fl}))


(defmethod {readdir hello-fuse-operations}
  (lambda (self path buf fd off fi flags)
    (def ret (@next-method self path buf fd off fi flags))
    (if (not (zero? ret)) ret
        (begin (fuse_fill_dir fd buf file-name #f 0 0)
          0))))

(defmethod {read fuse-operations}
  (lambda _ (-ENOENT)))
(set! fuse-operations-read
  (lambda (gfo path buf size offset fi)
    {read gfo path buf size offset fi}))

(def (main . args)
  (def go-args (getopt-parse go args))
  (def fargs (getopts->fuse go-args))


  (%main (fuse_args<-list
          [(car ##processed-command-line) fargs ...])))
