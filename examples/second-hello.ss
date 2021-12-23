(export (import: ../opt) main futz-struct)
(import :std/foreign :gerbil/gambit/foreign ../opt :gerbil/gambit)

(def (main . args) (%main (fuse_args<-list [(car ##processed-command-line) args ...])))
(begin-ffi (%main fuse_args* futz-struct)
  (c-declare "#include \"hello.c\"")
  (c-declare "#include <fuse_opt.h>")
  (define-macro (extern-c-struct name)
    (let ((exists? (assoc name c#c-interface-types)))
      (if exists?
        '(begin)
        `(define-c-struct ,name))))
  (extern-c-struct fuse_args)
  (define-c-lambda %main (fuse_args*) int "
int res = _main(___arg1->argc, ___arg1->argv);
___return(res);"))
