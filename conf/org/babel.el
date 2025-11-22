(use-package org :defer t)
(use-package org-bullets :defer t)
(use-package org-indent :defer t)
(use-package org-tempo :defer t)
(use-package ob-python :defer t)
(use-package ob-lisp :defer t)
(use-package ob-scheme :defer t)
(use-package ox-latex :defer t)

(add-to-list 'load-path
             (expand-file-name
              "~/.emacs.d/github/ox-ipynb/"))
(use-package ox-ipynb :defer t)

(with-eval-after-load 'org
  (progn
    (add-to-list 'org-src-lang-modes '("lisp" . lisp))
    (add-to-list 'org-src-lang-modes '("python" . python))
    (add-to-list 'org-src-lang-modes '("scheme" . scheme)))

  (setq org-babel-lisp-eval-fn 'sly-eval)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (plantuml . t)
     (lisp . t)
     (shell .t)
     (scheme . t)
     (python . t)
     (C . t)
     )))

