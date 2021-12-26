(export (import: ../opt) main)
(import :std/foreign :gerbil/gambit/foreign ../opt :gerbil/gambit)
(declare (not optimize-dead-definitions))
(def (main . args)
  (%main (fuse_args<-list
          [(car ##processed-command-line) args ...])))

(begin-ffi (%main fuse_args* gfuse-read)
  (namespace ("drewc/fuse/examples/first-read-hello#"
              file-contents))
  (c-declare "#define FUSE_USE_VERSION 31")
  (c-declare "#include <fuse.h>")
  (c-declare "#include <fuse_opt.h>")
  (c-declare "static int gfuse_read(char *, char *, long unsigned int,  int,  struct fuse_file_info *);")
  (c-define
   (gfuse-file-size) ()
   int "gfuse_file_size" ""
   (u8vector-length file-contents))
  (c-declare "#include \"gfuse_read-hello.c\"")
  (define-c-struct fuse_file_info)
  (c-define
   (gfuse-read path buf size offset fi)
   (char-string (pointer char) size_t int fuse_file_info*)
   int "gfuse_read" "static"
  
   (gfuse-read-bytes file-contents path buf size offset fi))
  (define file-contents (string->bytes "This is a byte sized string!\n"))
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
  
  	if(strcmp(path+1, options.filename) != 0)
  		___return(-ENOENT);
  
  	len = U8_LEN (bytes);
  
    fprintf(stderr, \"gfuse: This is gerbil read! %d %d %d \\n\", len, offset, size);
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
