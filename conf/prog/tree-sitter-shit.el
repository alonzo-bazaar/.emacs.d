(use-package tree-sitter
  :defer t
  :ensure t
  :config
  (add-to-list 'tree-sitter-load-path "~/.emacs.d/tree-sitter/")
  (add-to-list 'tree-sitter-major-mode-language-alist
               '(lisp-data-mode . commonlisp))
  (require 'tree-sitter-langs)
  ;(global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook 'tree-sitter-hl-mode)
  (add-hook 'snippet-mode-hook (lambda () (tree-sitter-mode -1))))

(defvar dont-vibe-with-treesit '(bqn-mode bqn-comint-mode
                                 forth-mode forth-interaction-mode
                                 uiua-mode uiua-interactive-mode
                                 gnu-apl-mode
                                 gnu-apl-interactive-mode
                                 gnu-apl-interactive-edit-mode
                                 dyalog-mode
                                 dyalog-array-mode
                                 dyalog-session-mode
                                 dyalog-debugger-mode
                                 jupyter-python-mode
                                 snippet-mode
                                 cuda-mode
                                 ))

(defun vibes-with-treesit-p (mode)
  "returns wether or not the major mode in question vibes with tree sitter,
used in some hooks to avoid enabling treesit minor mode with major modes
that don't really vibe with tree sitter"
  (not (-contains-p
        dont-vibe-with-treesit
        mode)))

(add-hook 'prog-mode-hook (lambda ()
                            (when (vibes-with-treesit-p
                                   major-mode) 
                              (tree-sitter-mode 1))))
