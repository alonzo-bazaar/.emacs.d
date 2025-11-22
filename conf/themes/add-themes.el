(add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/themes/everforest-theme/"))
(add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/themes/rose-pine-emacs/"))
(add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/themes/rose-pine-doom-emacs/"))

(use-package color-theme-modern)
(use-package dracula-theme)
(use-package solarized-theme)
(use-package color-theme-modern)
(use-package nord-theme)
(use-package nordless-theme)
(use-package northcode-theme)
(use-package nordic-night-theme)
(use-package autothemer)
(use-package ef-themes)

(use-package color-theme-sanityinc-tomorrow
  :ensure t
  :defer t)

(use-package doom-themes
  :ensure t
  :defer t
  :config
  (setq doom-themes-enable-bold t
        doom-zenburn-brighter-comments t
        doomt-themes-enable-italic t))
