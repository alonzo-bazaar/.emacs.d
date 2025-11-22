(setq scheme-program-name
      "scheme" ;; chez
      ;; "runjelly" ;; jelly
      ;; "kawa" ;; kawa
      )

(use-package geiser
  :ensure t
  :defer t
  :config
  (setf geiser-default-implementation 'guile))

(use-package cmuscheme :ensure t :defer t)
(defun runjelly ()
  (interactive)
  (let ((jelly-buffer (make-comint "jelly-shell" "runjelly")))
    (switch-to-buffer jelly-buffer)
    (inferior-scheme-mode)))
