;; forth
(use-package forth-mode
  :ensure t
  :defer t
  :config
  (setq forth-executable "gforth")
  ;; (setq forth-executable "ficl")
  (require 'forth-mode)
  (require 'forth-block-mode)
  (require 'forth-interaction-mode)
  (autoload 'forth-mode "gforth.el")
  (autoload 'forth-block-mode "gforth.el")
  (add-to-list 'auto-mode-alist '("\\.fs$" . forth-mode))
  (add-to-list 'auto-mode-alist '("\\.fb$" . forth-block-mode))
  (add-hook 'forth-mode (lambda () (tree-sitter-mode -1)))
  (add-hook 'forth-interaction-mode (lambda () (tree-sitter-mode -1)))
  (defun forth-dwim ()
    (interactive)
    (if (region-active-p)
        (forth-eval-region (region-beginning) (region-end))
      (progn
        (forth-eval-defun)
        (deactivate-mark))))
  (add-hook 'forth-mode-hook
            (lambda ()
              (progn
                (tree-sitter-mode 0)
                (setq forth-indent-level 4)
                (setq forth-minorindent-level 2)
                (setq forth-highlight-level 3)
                (local-set-key (kbd "C-c C-c") 'forth-dwim))))
  )
