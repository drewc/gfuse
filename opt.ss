(export
  %FUSE_ARGS_INIT
  fuse_args
  fuse_args*
  fuse_args-argc
  fuse_args-argv
  fuse_args-allocated
  fuse_args-ref
  fuse_args-ref-set!
  fuse_opt_insert_arg
  fuse_opt_add_arg
  fuse_args<-list list->fuse_args
  fuse_args->list list<-fuse_args)
(import :std/foreign :gerbil/gambit/foreign)

(def (fuse_args-ref fas n)
  (let (limit (fuse_args-argc fas))
    (and (> limit n) (%fuse_args-ref fas n))))

(def (fuse_args-ref-set! fas n v)
  (let (limit (fuse_args-argc fas))
    (if (> n limit) (error "arg index Out of range: ~a >= ~a "
                       n limit)
        (fuse_opt_insert_arg fas n v))))

(def (fuse_args->list fas)
  (def limit (fuse_args-argc fas))
  (let lst ((n 0))
    (if (= n limit) []
        (cons (fuse_args-ref fas n) (lst (1+ n))))))
(defalias list<-fuse_args fuse_args->list)

(def (fuse_args<-list lst)
  (def fas (%FUSE_ARGS_INIT (car lst)))
  (def n 1)
  (for-each (lambda (fa)
              (set! (fuse_args-ref fas n) fa)
              (set! n (1+ n)))
            (cdr lst))
  fas)
(defalias list->fuse_args fuse_args<-list)

(begin-ffi
    (%FUSE_ARGS_INIT
     fuse_opt_add_arg
     %fuse_args-ref
     fuse_opt_insert_arg
     fuse_args fuse_args* (struct fuse_args argc argv allocated)
     )
  (c-declare "#include <fuse_opt.h>")

  (c-declare "___SCMOBJ fuse_opt_ffi_free_args (void *ptr) {
       fuse_opt_free_args(ptr);
       return ___FIX (___NO_ERR);
      };
  ")
  
  (define-c-struct fuse_args
    ((argc . int)
     (argv . (pointer char-string))
     (allocated . int))
    "fuse_opt_ffi_free_args")
  ;;(c-define-type fuse_args (struct "fuse_args"))
  ;;(c-define-type fuse_args* (pointer fuse_args))

(define-c-lambda %FUSE_ARGS_INIT (char-string) fuse_args* #<<EOF
  char *argv[] = {
     ___arg1,
     NULL
  };
  struct fuse_args stack_args = FUSE_ARGS_INIT(1, argv);
  struct fuse_args *heap_args;
  heap_args = (struct fuse_args *) malloc(sizeof(struct fuse_args));
  *heap_args = stack_args;
  

	/* This seems to be what is needed to init and allocate. */
	if (fuse_opt_parse(heap_args, NULL, NULL, NULL) == -1) {
		___return(NULL);   };
  ___return(heap_args);
EOF
)

  (define-c-lambda fuse_opt_insert_arg (fuse_args* int char-string) int
    "fuse_opt_insert_arg")

  (define-c-lambda %fuse_args-ref (fuse_args* int) char-string
    "char* ret = ___arg1->argv[___arg2];
  ___return(ret);"))
