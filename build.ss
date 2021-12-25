#!/usr/bin/env gxi
(import :std/build-script :std/make
        :gerbil/gambit/ports :gerbil/compiler/driver)

(def libs "fuse3")
(def gerbil-path (getenv "GERBIL_PATH" "~/.gerbil"))
(def gerbil-home (getenv "GERBIL_HOME" gxc#default-gerbil-home))

(def srcdir (path-directory (this-source-file)))
(def libdir (path-expand "lib" gerbil-path))
(def bindir (path-expand "bin" gerbil-path))
(def statdir (path-expand "static" libdir))
(def gerbil-gsc std/make#gerbil-gsc)
(def gambcsharp (path-expand "lib/static/gx-gambc#.scm" gerbil-home))

(def (fgxc fn . rest)
  (cons*
   gxc: fn
   "-cc-options"
   (pkg-config-cflags libs)
   "-ld-options"
   (pkg-config-libs libs)
   rest))

(def -cc-ld
  (list "-cc-options" (pkg-config-cflags libs) "-ld-options" (pkg-config-libs libs)))

(def (force-outputs) (force-output (current-error-port)) (force-output))
(def (message . lst) (apply displayln lst) (force-outputs))

(def (copy-compiled file)
  (def libpath (path-expand (string-append "drewc/fuse/" file) libdir))
  (create-directory* (path-directory libpath))
  (message "... copy " file " to " libpath)

  (when (file-exists? libpath)
    (delete-file libpath))
  (copy-file file libpath))

(def (copy-static file)
  (def spath (path-expand file statdir))
  (def fpath (path-expand file (path-expand "static/" (path-directory (this-source-file)))))
  (message "... copy static include " file)
  (when (file-exists? spath)
    (delete-file spath))
  (copy-file fpath spath))

(def (g-compile-static-exe file)
  (def fn (path-strip-extension file))
  (def scmx (string-append fn ".scmx"))
  (def bin (path-expand (path-strip-directory fn) "./bin/"))
  (def -e (string-append "(include \"" gambcsharp "\")"))
  (def (gxcomp)
    (compile-static-exe
     (string-append fn ".ss")
     [ verbose: #t
       invoke-gsc: #f
       output-file: file keep-scm: #t
     ]))
  (def (gscomp)
    (let* ((proc (open-process
                  [path: (gerbil-gsc)
                   arguments: [ "-:i8,f8,-8,t8" #;"-verbose" "-exe" "-o" bin -cc-ld ... "-e" -e scmx]
                   stdout-redirection: #f]))
         (status (process-status proc)))
    (close-port proc)
    (unless (zero? status)
      (error "Compilation error; gsc exited with nonzero status" status)))
    )
  (gxcomp)
  (shell-command (string-append
                  "sed 's/(optimize-dead-definitions)//g' -i "
                  scmx))
  (gscomp))




(def (premade path)
  (def posts
    '("__0.o1"
      "__rt.o1"
      ".ssi"
      ".ssxi.ss"))
  (def files (map (cut string-append path <>) posts))

  (map (cut copy-compiled <>) files))

(def (make-clean)
  (shell-command "find . -name '*__*.o*' -exec rm -v {} \\;")
  (shell-command "find . -name '*.ssi' -exec rm -v {} \\;")
  (shell-command "find . -name '*.ssxi.ss' -exec rm -v {} \\;")
  (shell-command "find . -type d -name 'static' -exec rm -rv {} \\;"))

(def (local-build)
  (defbuild-script
    `(                                  ; "c2ffi-libfuse"
      ,(fgxc "opt")
      ,(fgxc "examples/try-main-hello")
      ,(fgxc "examples/first-hello")
      ,(fgxc "examples/second-hello")
      ,(fgxc "examples/gfuse-read-hello")
       ;; ,(let (libs (cddr (fgxc "asd")))
       ;;   ;; (displayln " Libs ~a" libs)
       ;;   `(gxc: "examples/gfuse-read-hello"
       ;;          ["-s"] "-keep-temp" ,@libs))


             ;  '("-s" "-gsc-flag" "-keep-temp"))
                                        ;,(fgxc "examples/first-hello-exe")
      #;(gxc: "libfuse"
      "-cc-options"                     ;
      ,(pkg-config-cflags libs)         ;
      "-ld-options"                     ;
      ,(pkg-config-libs libs)           ;
      )
      )
    verbose: 1
    libdir: (path-directory (this-source-file)))

  (main))

(def (build-exes)
  (defbuild-script
    `((exe: ,@(cdr (fgxc "examples/first-hello")))
      (static-exe: ,@(cdr (fgxc "examples/second-hello")))
      #;(static-exe: ,@(cdr (fgxc "examples/gfuse-read-hello"
                                "-flat")))
      )
    verbose: 1
    libdir: (path-directory (this-source-file))
    bindir: (path-expand "bin/" (path-directory (this-source-file))))
  (main))

(def (make-install)
 (premade "opt")
 (premade "examples/try-main-hello")
 (premade "examples/first-hello")
 (premade "examples/second-hello")
 (premade "examples/gfuse-read-hello")
 (for-each copy-static
           (directory-files (path-expand "static/" (path-directory (this-source-file))))))


(def (main . args)
  (parameterize ((current-directory srcdir))
  (if (and (pair? args) (equal? (car args) "clean"))
    (make-clean)
    (begin
      (make-clean)
      (local-build)
      (make-install)
      (g-compile-static-exe "examples/gfuse-read-hello")
      (build-exes)
      (make-install)))))
