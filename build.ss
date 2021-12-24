#!/usr/bin/env gxi
(import :std/build-script :std/make
        :gerbil/gambit/ports)

(def libs "fuse3")
(def gerbil-path (getenv "GERBIL_PATH" "~/.gerbil"))
(def libdir (path-expand "lib" gerbil-path))
(def bindir (path-expand "bin" gerbil-path))
(def statdir (path-expand "static" libdir))

(def (fgxc fn . rest)
  (cons*
   gxc: fn
   "-cc-options"
   (pkg-config-cflags libs)
   "-ld-options"
   (pkg-config-libs libs)
   rest))

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
      ;;(static-exe: ,@(cdr (fgxc "examples/gfuse-read-hello")))
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
  (if (and (pair? args) (equal? (car args) "clean"))
    (make-clean)
    (begin
      (make-clean)
      (local-build)
      (make-install)
      (build-exes)
      (make-install))))
