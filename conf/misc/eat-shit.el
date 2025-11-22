(use-package eat
  :ensure t
  :defer t
  :config
  (defun eat-fish ()
    "it's ok to eat fish, 'cause they don't have any feelings"
    (interactive)
    (eat "fish"))
  (defun eat-python ()
    "I am still in a dream snake eater"
    (interactive)
    (eat "python"))
  (defun eat-ipython ()
    "I am still in a (interacive) dream snake eater"
    (interactive)
    (eat "ipython")))
