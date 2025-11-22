(use-package org-roam
  :ensure t
  :defer t
  :config
  (setq org-roam-directory "~/Documents/org/roam")
  (org-roam-db-autosync-mode)
  (require 'emacsql-sqlite-builtin)
  (setq org-roam-database-connector 'sqlite-builtin))
