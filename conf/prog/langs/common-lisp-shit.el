;;(load (expand-file-name "~/.roswell/helper.el"))
;;carica slime, io voglio sly
(setq inferior-lisp-program "ros -Q run")

(use-package sly
  :ensure t
  :defer t
  :config
  (add-hook 'sly-mode-hook
            (lambda ()
              (company-mode 1))))
