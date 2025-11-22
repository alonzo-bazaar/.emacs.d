(use-package company)

(add-hook 'prog-mode-hook (lambda ()
                            (company-mode 1)
                            (rainbow-delimiters-mode 1)
                            (hs-minor-mode 1)
                            (column-number-mode 1)
                            (display-line-numbers-mode 1)
                            ))

(add-hook 'eshell-mode-hook (lambda ()
                              (company-mode 1)))

(add-hook 'inferior-python-mode (lambda ()
                                  (company-mode 1)))
