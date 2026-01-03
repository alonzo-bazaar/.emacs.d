;; bqn
(use-package bqn-mode
  :defer t
  :ensure t
  :config
  (add-hook 'bqn-mode-hook
            (lambda ()
              (eglot-ensure)
			  (local-set-key (kbd "»") 'self-insert-command) ;; clashes with a global setting o' mine otherwise
              (local-set-key (kbd "C-c C-c") 'bqn-comint-send-region)))
  (add-hook 'bqn-comint-mode-hook
			(lambda ()
			  (local-set-key (kbd "»") 'self-insert-command)))

  (with-eval-after-load 'align
	(add-to-list 'align-rules-list
				 '(bqn-comments
				   ;; matches and caputres the whitespace we're interested in
				   ;; the \\(\\s-*\\) thing captures, using the syntax \\(<stuff to be captured>\\), a group of 0 or more whitespace, denoted with \\s-*
				   ;; at least that's what I've gathered by staring at the `align-rules-alist' definition and docs
				   (regexp . "\\(\\s-*\\)#\\(\\s-*\\)")

				   ;; which groups of whitespace can we modify?
				   ;; we're not always guaranteed to be able to modify all whitespace in a given match, so
				   (group . (1 2 3))

				   ;; which modes is this alignment rule active in?
				   (modes . '(bqn-mode bqn-comint-mode))))

	(add-to-list 'align-rules-list
				 '(bqn-assignments
				   (regexp . "\\(\\s-*\\)←\\(\\s-*\\)")
				   (group . (1 2 3))
				   (modes . '(bqn-mode bqn-comint-mode))))))
