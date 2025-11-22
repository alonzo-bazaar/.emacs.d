(use-package windresize
  :config
  (global-set-key (kbd "C-x w r") 'windresize))

(use-package beacon
  :ensure t
  :defer t
  :config
  (beacon-mode 1))

(use-package olivetti
  :ensure t
  :defer t
  :config
  (add-hook 'olivetti-mode-hook
            (lambda ()
              (olivetti-set-width 100))))

(use-package neotree
  :after (evil)
  :ensure t
  :defer t
  :config
  (setq neotree-smart-open t)

  (defun neotree-toggle-insert-mode ()
    (interactive)
    (if (neo-global--window-exists-p)
        (neotree-hide)
      (progn
        (neotree-show)
        (evil-insert-state))))

  (global-set-key "\M-q" 'neotree-toggle-and-insert-mode)
  (evil-define-key 'normal 'global (kbd "<leader>q") 'neotree-toggle-and-insert-mode)
  (evil-define-key 'normal neotree-mode-map (kbd "j") 'neotree-next-line)
  (evil-define-key 'normal neotree-mode-map (kbd "k") 'neotree-previous-line)
  (evil-define-key 'normal neotree-mode-map (kbd "n") 'neotree-create-node)
  (evil-define-key 'normal neotree-mode-map (kbd "d") 'neotree-delete-node)

  (evil-define-key 'normal neotree-mode-map (kbd "r") 'neotree-rename-node)
  (evil-define-key 'normal neotree-mode-map (kbd "c") 'neotree-copy-node)
  (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
  (evil-define-key 'normal neotree-mode-map (kbd "h") 'neotree-hidden-file-toggle)
  (evil-define-key 'normal neotree-mode-map (kbd "g") 'neotree-refresh)
  (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide))
