(export (import: ../opt) main)
(import :std/foreign :gerbil/gambit/foreign ../opt)

(def (main . args) (%main (fuse_args<-list ["first-hello" args ...])))
(begin-ffi (%main fuse_args*)
  (c-declare "#include \"hello.c\"")
  (c-declare "#include <fuse_opt.h>")
  (define-c-struct fuse_args)
  (define-c-lambda %main (fuse_args*) int "
int res = _main(___arg1->argc, ___arg1->argv);
___return(res);"))
