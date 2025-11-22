(use-package yasnippet
  :ensure t
  ;; :defer t
  :config
  (setq *snippet-shorthand-list*
        '((?b "\\mathbb" . 1)
          (?c "\\mathcal" . 1)
          (?f "\\frac" . 2)
          (?s "\\sum" . 0)
          (?l "\\lim" . 0)
          (?i "\\int" . 0)
          (?p "\\prod" . 0)
          (?d "_" . 1)
          (?u "^" . 1)
          (?v "\\overrightarrow" . 1)
          (?o "\\overline" . 1)
          ))

  (defun subsnippet-from-char (c) (assoc c *snippet-shorthand-list*))
  (defun subsnippet-symbol (s) (cadr s))
  (defun subsnippet-arg-count (s) (cddr s))

  (defun create-snippet-from-shorthand (short)
    "the short arg is a shorthand for a snippet, retuns a yasnippet snippet created from the shorthand"
    ;; input cleanup
    (setq short (string-clean-whitespace short))
    ;; now expand every char of the shorthand
    ;; some initial setting
    (let ((s-len (length short))
          (acc "")
          (index-in-snippet 1))
      ;; then iterate every char of the shorthand
      ;; appending the expansion to an accumulator
      (dotimes (i s-len)
        (let* ((c (aref short i))
               (ss (subsnippet-from-char c))
               (s-sym (subsnippet-symbol ss))
               (s-argc (subsnippet-arg-count ss)))
          (setq acc (concat acc s-sym))
          (dotimes (x s-argc)
            (setq acc (concat acc "{$" (number-to-string index-in-snippet) "}"))
            (setq index-in-snippet (1+ index-in-snippet)))))
      (concat acc "$0")))

  (yas-global-mode 1))

;; (use-package yasnippet-snippets)

(global-set-key (kbd "C-c m")
		(lambda (s)
		  (interactive "sShorthand: ")
		  (yas-expand-snippet (create-snippet-from-shorthand s))))

(global-set-key (kbd "C-c C-c C-m")
		(lambda (s)
		  (interactive "sShorthand: ")
		  (yas-expand-snippet (create-snippet-from-shorthand s))))
