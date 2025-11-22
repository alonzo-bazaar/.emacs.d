(add-hook 'emacs-everywhere-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c C-c") 'emacs-everywhere-finish)))
