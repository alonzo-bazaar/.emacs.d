(use-package evil
  :preface (setq evil-disable-insert-state-bindings t)
  :config
  (setq evil-esc-delay 0.0)
  (evil-mode 1)
  (evil-normal-state)

  (evil-set-leader 'normal (kbd "SPC"))
  (evil-set-leader 'insert (kbd "M-SPC"))

  (evil-define-key 'normal 'global "ç" 'evil-ex) ;; italian :

  (evil-define-key 'normal 'global (kbd "<leader>x") 'execute-extended-command)
  (evil-define-key 'normal 'global (kbd "<leader>w") 'shell-command)
  (evil-define-key 'normal 'global (kbd "<leader>W") 'async-shell-command)
  (evil-define-key 'normal 'global (kbd "<leader>a")
    (lambda () (interactive) (other-window 1)))

  (evil-define-key 'normal 'global (kbd "<leader>vh") 'split-window-below)
  (evil-define-key 'normal 'global (kbd "<leader>vs") 'split-window-right)
  (evil-define-key 'normal 'global (kbd "<leader>vo") 'delete-window)

  (add-hook 'dashboard-mode-hook 'evil-insert-state)
  (add-hook 'dired-mode-hook 'evil-insert-state))
