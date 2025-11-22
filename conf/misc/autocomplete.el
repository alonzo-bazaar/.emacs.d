(use-package company :ensure t)
(setq company-miminum-prefix-length 2)

(with-eval-after-load 'company
  (define-key company-active-map (kbd "<return>") nil)
  (define-key company-active-map (kbd "RET") nil)
  (define-key company-active-map (kbd "<tab>") 'company-complete-selection))

;; copied from prot
;; https://protesilaos.com/codelog/2024-02-17-emacs-modern-minibuffer-packages/
(use-package orderless
  :ensure t
  :config
  (setq completion-styles '(orderless basic)))

(use-package consult
  :ensure t
  :bind (;; A recursive grep
         ("M-s M-v g" . consult-grep)
         ;; Search for files names recursively
         ("M-s M-v f" . consult-find)
         ;; Search through the outline (headings) of the file
         ("M-s M-v o" . consult-outline)
         ;; Search the current buffer
         ("M-s M-v l" . consult-line)
         ;; Switch to another buffer, or bookmarked file, or recently
         ;; opened file.
         ("M-s M-v b" . consult-buffer)))

(use-package embark
  :ensure t
  :bind (("C-." . embark-act)
         :map minibuffer-local-map
         ("C-c C-c" . embark-collect)
         ("C-c C-e" . embark-export)))

(use-package embark-consult
  :ensure t)

(use-package wgrep
  :ensure t
  :defer t
  :bind ( :map grep-mode-map
          ("e" . wgrep-change-to-wgrep-mode)
          ("C-x C-q" . wgrep-change-to-wgrep-mode)
          ("C-c C-c" . wgrep-finish-edit)))

(require 'vertico)
(require 'marginalia)
(marginalia-mode 1)
(vertico-mode 1)
(setq vertico-count 6)
