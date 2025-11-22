(use-package clojure-mode
  :ensure t
  :defer t)

(use-package cider
  :ensure t
  :defer t
  :config
  (add-hook 'clojure-mode-hook #'cider-mode))
