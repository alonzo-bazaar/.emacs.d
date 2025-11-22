(use-package lsp
  ;; :ensure t
  :defer t
  :config
  (setq lsp-signature-function 'lsp-signature-posframe
        lsp-signature-auto-activate nil
        lsp-signature-doc-lines 1))

(use-package lsp-mode :ensure t :defer t)
(use-package lsp-docker :ensure t :defer t)
(use-package lsp-scheme :ensure t :defer t)
(use-package lsp-pyright :ensure t :defer t)
(use-package lsp-jedi :ensure t :defer t)
(use-package lsp-python-ms :ensure t :defer t)
(use-package lsp-treemacs :ensure t :defer t)
(use-package lsp-java :ensure t :defer t)
(use-package lsp-docker :ensure t :defer t)

(setq lsp-enable-indentation nil)

(setq muh-lsp-packages '(lsp-mode
                         lsp-docker
                         lsp-scheme
                         lsp-pyright
                         lsp-jedi
                         lsp-python-ms
                         lsp-treemacs
                         lsp-java
                         ))

(setq read-process-output-max (* 1024 1024)
      gc-cons-threshold 102400000
      gc-cons-threshold 102400000)

(defun lsp-delete-every-package ()
  "look at all the packages again, installing whatever is in the list you didn't install"
  (interactive)
  (dolist (pkg muh-lsp-packages)
    ;; stolen from package-reinstall in package.el
    (when (package-installed-p pkg)
      (package-delete (cadr (assq pkg package-alist)) 'force 'nosave))))

(defun potential-reinstall-lsp ()
  "look at all the packages again, installing whatever is in the list you didn't install"
  (interactive)
  (package-refresh-contents)
  (dolist (pkg muh-lsp-packages)
    (unless (package-installed-p pkg)
      (package-install pkg))
    (require pkg)))

(defun lsp-business-as-usual ()
  (lsp-delete-every-package)
  (potential-reinstall-lsp))
