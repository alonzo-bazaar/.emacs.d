;; idfk
(let ((cwd (expand-file-name "~/.emacs.d/conf/themes/")))
  (dolist (file `(,(concat cwd "add-themes.el")
		  ,(concat cwd "themehooks.el")
		  ,(concat cwd "change-theme.el")
		  ,(concat cwd "theme-on-wm.el")))
    (load file)))
