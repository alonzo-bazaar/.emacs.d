(use-package python 
  :ensure t
  :defer t
  :init
  (local-unset-key (kbd "C-M-x"))
  (local-set-key (kbd "C-c C-l") 'python-shell-send-file)
  (local-set-key (kbd "C-c C-d") 'python-shell-send-defun)
  (local-set-key (kbd "C-c C-c C-r") 'python-shell-restart)
  :config
  (setq python-indent-offset 4)
  (setq-default indent-tabs-mode nil)
  (setq warning-minimum-level :error))

(defun set-python-shell-to-ipython ()
  (interactive)
  (when (executable-find "ipython")
    ;; flag --pylab visto da
    ;; https://stackoverflow.com/questions/17817019/how-to-open-ipython-interpreter-in-emacs
    ;; e poi giustamente scagato

    ;; https://www.emacswiki.org/emacs/PythonProgrammingInEmacs#h5o-44
    ;; funziona meglio
    (setq python-shell-interpreter "ipython"
          ;; python-shell-interpreter-args "-i --simple-prompt --InteractiveShell.display_page=True"
          python-shell-interpreter-args "-i --InteractiveShell.display_page=True"
          )))

(defun set-python-shell-to-python ()
  (interactive)
  (when (executable-find "python")
    ;; flag --pylab preso da
    ;; https://stackoverflow.com/questions/17817019/how-to-open-ipython-interpreter-in-emacs
    ;; non so cosa faccia ma spero sia figo
    (setq python-shell-interpreter "python")
    (setq python-shell-interpreter-args "-i")))

(define-derived-mode jupyter-python-mode
  python-mode "Jupyter Python"
  "Thing I just defined so that I don't need to rewrite headers in notebooks converted to org mode")

(add-to-list 'auto-mode-alist '("\\.jinja\\'" . jinja2-mode))
