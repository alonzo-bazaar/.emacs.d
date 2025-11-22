(with-eval-after-load 'eglot
  (progn
    (add-to-list 'eglot-server-programs
		 '(racket-mode . ("racket" "-l" "racket-langserver")))
    (add-to-list 'eglot-server-programs
		         '(js-mode . ("npx" "typescript-language-server" "--stdio")))
    ;; brutal? yes, very
    (add-to-list 'eglot-server-programs
                 '(bqn-mode . ("/home/nil/.local/cloned/bqnlsp/target/release/bqnlsp")))
    (add-to-list 'eglot-server-programs
                 '(uiua-mode . ("uiua" "lsp")))))
