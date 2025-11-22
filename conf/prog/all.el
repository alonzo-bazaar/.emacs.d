(let ((cwd (expand-file-name "~/.emacs.d/conf/prog/")))
  (dolist (file (append
		 `(,(concat cwd "general-prog.el")
		   ,(concat cwd "tree-sitter-shit.el")
		   ,(concat cwd "lsp-shit.el")
		   ,(concat cwd "eglot-shit.el"))
		 (mapcar (lambda (file) (concat cwd file))
			   (directory-files (concat cwd "langs") t "[[:alnum:]]+.el$"))))
    (load file)))
