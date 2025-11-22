(use-package rust-mode :ensure t :defer t)
(use-package toml-mode :ensure t :defer t)
(use-package racket-mode :ensure t :defer t
  :after (racket-xp-mode)
  :config
  (add-hook 'racket-mode-hook 'racket-xp-mode))

(use-package ess :ensure t :defer t)
(use-package dap-mode :ensure t :defer t)

(use-package auctex :defer t)

(use-package sxhkdrc-mode :ensure t :defer t)
