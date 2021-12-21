(export try-main)
(import :std/foreign :gerbil/gambit/foreign :gerbil/gambit/threads)

(begin-ffi (try-main)
  (c-declare "#include \"hello.c\"")
  (define-c-lambda try-main () int "
char *argv[] = {
   (char*)\"./hello\",
   (char*)\"-d\",
   (char*)\"-o\",
   (char*)\"allow_other\",
   (char*)\"/tmp/gfuse-test\",
   NULL
};

fprintf(stderr, \"gfuse: This is gerbil main! %s\\n\", argv[0]);

int res = _main(5, argv);
___return(res);"))
