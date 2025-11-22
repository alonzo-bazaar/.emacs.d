(use-package auctex
  :ensure t
  :defer t
  :config
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil))

(add-hook 'LaTeX-mode-hook 'visual-line-mode)
;; (add-hook 'LaTeX-mode-hook 'flyspell-mode)
;; quando capisco come funziona per non anglofoni
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

(modify-coding-system-alist 'file "\\.tex\\'" 'utf-8)

(add-hook 'tex-mode-hook (lambda ()
                           (eglot-ensure)
                           (company-mode 1)
                           (display-line-numbers-mode 1)))
