(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
             '("nongnu" . "https://elpa.nongnu.org/nongnu/"))
(package-initialize)

(defun load-dir-all (dirname)
  (load (expand-file-name
         (concat dirname
                 (if (= ?/ (aref dirname (1- (length dirname))))
                     "" "/")
                 "all.el"))))

(defun load-dir (dirname)
  (dolist (file (directory-files dirname t "^[[:alnum:]].+el$"))
    (load file)))

(let ((cwd (expand-file-name "~/.emacs.d/")))
  (load-dir (concat cwd "./conf/misc/"))
  (load-dir (concat cwd "./conf/binds/"))
  (load-dir-all (concat cwd "./conf/themes/"))

  (load-dir (concat cwd "./conf/org/"))
  (load-dir-all (concat cwd "./conf/prog/")))

(set-theme-based-on-wm)
(going-dark)
(font-like-em-normal)
(font-like-em-normal)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("5c7720c63b729140ed88cf35413f36c728ab7c70f8cd8422d9ee1cedeb618de5"
	 "f5a7c10fbb726e90a3befca828b2a4de493404a13ce42dcbeb5212ecd553189e"
	 default))
 '(inhibit-startup-screen t)
 '(org-format-latex-options
   '(:foreground default :background default nil nil :scale 2.0 nil nil
				 :html-foreground "Black" :html-background
				 "Transparent" :html-scale 1.0 :matchers
				 ("begin" "$1" "$" "$$" "\\(" "\\[")))
 '(org-latex-engraved-options
   '(("commandchars" . "\\\\\\{\\}")
	 ("highlightcolor" . "white!95!black!80!blue")
	 ("breaklines" . "true")
	 ("breaksymbol"
	  . "\\color{white!60!black}\\tiny\\ensuremath{\\hookrightarrow}")))
 '(package-selected-packages
   '(@ all-the-icons auctex-latexmk auto-complete autothemer beacon
	   beframe benchmark-init bnf-mode bqn-mode cargo ccls cider
	   cmake-mode color-theme-modern color-theme-sanityinc-tomorrow
	   company-glsl corfu cuda-mode dashboard dired-hide-dotfiles
	   dockerfile-mode doom-themes dracula-theme dyalog-mode eat
	   ebnf-mode ediprolog ef-themes ein emacs-everywhere
	   emacsql-sqlite-builtin embark-consult engrave-faces ess esup
	   evangelion-theme evil fill-column-indicator flycheck forth-mode
	   futhark-mode geiser-chez geiser-guile geiser-kawa
	   geiser-overlay gnu-apl-mode goto-last-change haskell-emacs
	   haskell-mode jetbrains-darcula-theme jinja2-mode jupyter
	   lsp-java lsp-jedi lsp-latex lsp-pyright lsp-python-ms
	   lsp-scheme lsp-ui lua-mode marginalia meow minizinc-mode
	   multiple-cursors neotree nord-theme nordic-night-theme
	   nordless-theme northcode-theme nyan-mode olivetti orderless
	   org-bullets org-roam paredit pkg-info pyenv-mode pyvenv
	   racket-mode rainbow-delimiters rainbow-mode ros rust-mode sly
	   sly-overlay solaire-mode solarized-theme spacious-padding
	   sxhkdrc-mode toml toml-mode tree-sitter-langs uiua-ts-mode
	   undo-fu undo-tree vertico web-mode wgrep windresize yaml-mode
	   yasnippet yuck-mode))
 '(tab-width 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
