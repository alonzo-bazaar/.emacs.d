;; roba che non uso più
;; ma fa comodo avere

(defun cazzo-load (name &optional default-behaviour)
  "loads .emacs.d/cazzo/`name' if such a file exists,
if no such file exists it runs `default-behaviour' (a lambda) with no parameters, `default-behaviour' does nothing if not specified

mainly used to provide different settings to emacs when autstarting from different window mangers, and by that I mean the color theme
"
  (setq default-behaviour (or default-behaviour (lambda () nil)))
  (let* ((cazzo-home (expand-file-name "~/.emacs.d/cazzo/"))
         (cazzo-file (concat cazzo-home name))
         (cazzo-retirement-file (concat cazzo-home "old/" name)))
    (if (file-exists-p cazzo-file)
        (progn
          (load (expand-file-name cazzo-file) nil nil t)
          (start-process "move-idfk" nil "mv" cazzo-file cazzo-retirement-file))
      (funcall default-behaviour))))

;; default dark theme behaviour can be overridden by creating a themecazzo.el file
;; (cazzo-load "themecazzo.el" (lambda ()
;;                               (setq muh-light-theme 'ef-melissa-light)
;;                               (setq muh-dark-theme 'ef-autumn)))

;; TODO parametro fill-mode e una funzione set-wallpaper un po' più alto livello?
(defun wall-fill (wall)
  (if (xorg-p)
      (start-process "xwall" nil "feh" "--no-fehbg" "--bg-fill" wall)
    (start-process "waywall" nil "swaybg" "-m" "center" "-i" wall)))
(defun wall-center (wall)
  (if (xorg-p)
      (start-process "xwall" nil "feh" "--no-fehbg" "--bg-center" wall)
    (start-process "waywall" nil "swaybg" "-m" "center" "-i" wall)))

(add-hook 'prog-mode-hook (lambda ()
                            (when (vibes-with-treesit-p major-mode) 
                              (tree-sitter-mode 1))
                            (company-mode 1)
                            (rainbow-delimiters-mode 1)
                            (hs-minor-mode 1)
                            (column-number-mode 1)
                            (display-line-numbers-mode 1)
                            ;; C-c C-r to be used for refactoring commands
                            ;; intellij my beloved
                            ;; -- ;; -- ;; (local-unset-key (kbd "C-c C-r"))
                            ;; -- ;; -- ;; (local-set-key (kbd "C-c C-r C-r")
                            ;; -- ;; -- ;;                ;; rename
                            ;; -- ;; -- ;;                (lambda ()
                            ;; -- ;; -- ;;                  (interactive)
                            ;; -- ;; -- ;;                  (cond ((boundp 'eglot-rename)
                            ;; -- ;; -- ;;                         (eglot-rename))
                            ;; -- ;; -- ;;                        ((boundp 'lsp-rename)
                            ;; -- ;; -- ;;                         (lsp-rename))
                            ;; -- ;; -- ;;                        (t (message "no lsp active, cannot rename")))))
                            ))

(defmacro and-insert-state (fun)
  `(lambda () (interactive) (evil-insert-state) (,fun)))

;; (global-set-key (kbd "\C-q") (and-insert-state neotree-))

;; (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; java
;; mostly lsp mosty copied from
;; https://www.reddit.com/r/emacs/comments/j4xz2w/got_lspjava_working_with_gradle_and_java_15_on/
;(use-package lsp-java :after lsp
;  :init (setq lsp-java-configuration-runtimes '[(:name "JavaSE-21"
;                                                       :path "/usr/lib/jvm/java-21-openjdk"
;                                                       :default t)]
;              lsp-java-vmargs (list
;                               "-noverify"
;                               "--enable-preview"))
;  :config (progn (require 'dap-java)))


;;  (setq org-babel-execute:python
;;        (lambda (body params)
;;          (setq output-p (cdr (assq :output params)))

;; thesis moment
;; https://www.reddit.com/r/emacs/comments/qncmmr/using_a_custom_latex_class_for_org_export/
(add-to-list 'org-latex-classes
                 '("Tptesi2" "\\documentclass{Tptesi2}"
                   ("\\chapter{%s}" . "\\chapter*{%s}")
                   ("\\section{%s}" . "\\section*{%s}")
                   ("\\subsection{%s}" . "\\subsection*{%s}")
                   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                   ("\\paragraph{%s}" . "\\paragraph*{%s}")
                   ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(defun oh-shit-thesis-moment ()
  "fuck with the org defaults a bit to make them fit with the uni thesis template"
  (interactive)
  (setq org-latex-with-hyperref nil)
  (setq org-latex-default-packages-alist
      '(("AUTO" "inputenc" t ("pdflatex"))
        ("T1" "fontenc" t ("pdflatex"))
        (#1="" "graphicx" t)
        (#1# "longtable" nil)
        (#1# "wrapfig" nil)
        (#1# "rotating" nil)
        ("normalem" "ulem" t)
        ("fleqn" "amsmath" t)
        (#1# "amssymb" t)
        (#1# "capt-of" nil)
        (#1# "hyperref" nil))))

(setq muh-packages '(;; required by evil mode on newer emacsen
                     undo-tree
                     undo-fu
                     goto-last-change
                     ;; fundamental
                     evil
                     neotree
                     ;; almost fundamental
                     flycheck
                     auto-complete
                     ;; colours
                     ;; some other 9001 themes installed here and not listed
                     ;; language support
                     ;; little extras
                     beacon
                     olivetti
                     all-the-icons
                     org-bullets

                     ;; and this is where things get get stupid
                     treemacs
                     meow
                     org-roam
                     emacsql-sqlite-builtin
                     vertico
                     forth-mode
                     ;;minizinc-mode

                     ;; protesilaos my beloved
		             beframe
                     sxhkdrc-mode ;(not supported in older emacsen)
                     ))

(defun potential-reinstall ()
  "look at all the packages again, installing whatever is in the list you didn't install"
  (interactive)
  (package-refresh-contents)
  (dolist (pkg muh-packages)
    (unless (package-installed-p pkg)
      (package-install pkg))
    (require pkg)))
