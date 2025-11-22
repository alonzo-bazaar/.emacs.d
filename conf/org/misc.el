(with-eval-after-load 'org
  (setq org-src-window-setup 'current-window)
  (defun fucking-source-buffer-window ()
    (interactive)
    (if (eq org-src-window-setup 'current-window)
        (progn
          (setq org-src-window-setup 'plain)
          (message "ok, we gon split boye"))
      (progn
        (setq org-src-window-setup 'current-window)
        (message "ok, we don't gon split no more"))))

  (add-to-list 'org-preview-latex-process-alist 'dvipng)
  ;; https://emacs.stackexchange.com/questions/27154/exporting-highlighted-source-code-to-pdf-in-org-mode
  (defmacro nil/remove-from-list (lst target &optional test)
    (cl-assert (symbolp lst)) ; not making a gensym for this
    (let ((test (or test 'equal))
          (tarsym (cl-gensym "target")))
      `(let ((,tarsym ,target))
         (setq ,lst (cl-remove-if (lambda (x) (,test x ,tarsym)) ,lst)))))

  ;; I have no idea wether this makes any sense or not
  (defun nil/org-export-switch-to-minted ()
    (interactive)
    (setq org-latex-src-block-backend 'minted)
                                        ; (setq org-src-fontify-natively t)

    (add-to-list 'org-latex-packages-alist '("newfloat" "minted"))

    (nil/remove-from-list org-latex-packages-alist '("" "listings"))
    (nil/remove-from-list org-latex-packages-alist '("" "color")))

  (defun nil/org-export-switch-to-engraved ()
    (interactive)
    (setq org-latex-src-block-backend 'engraved)
                                        ; (setq org-src-fontify-natively t)

    (add-to-list 'org-latex-packages-alist '("" "listings"))
    (add-to-list 'org-latex-packages-alist '("" "color"))

    (nil/remove-from-list org-latex-packages-alist '("newfloat" "minted")))

  (nil/org-export-switch-to-minted))

(add-hook 'org-mode-hook
          (lambda ()
            (org-bullets-mode 1)
            (visual-line-mode 1)
            (org-indent-mode 1)
            (local-set-key (kbd "C-<tab>") 'org-table-next-row)
          ))
