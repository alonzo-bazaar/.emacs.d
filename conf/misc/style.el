(add-to-list 'default-frame-alist '(undecorated . t))

(add-to-list 'display-buffer-alist
             `(,shell-command-buffer-name-async
               . (display-buffer-no-window)))

(setq frame-resize-pixelwise t)

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq ring-bell-function 'ignore)

(setq tab-width 4)
(setq scroll-conservatively most-positive-fixnum)
(show-paren-mode t)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(horizontal-scroll-bar-mode -1)
