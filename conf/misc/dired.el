(require 'ls-lisp)
(setq ls-lisp-dirs-first 't)
(setq ls-lisp-use-insert-directory-program nil)

(add-hook 'dired-mode-hook (lambda ()
                             (progn
                               (dired-hide-details-mode 1)
                               ;;(dired-hide-dotfiles-mode 1)
                               (local-set-key (kbd "z") 'dired-hide-details-mode)
                               (local-set-key (kbd "C-z") 'dired-hide-dotfiles-mode)
                               (local-set-key (kbd "C-c i") 'image-at-point)
                               (local-set-key (kbd "C-c p") 'pdf-at-point))))
