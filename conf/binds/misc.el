(defun kill-hide()
  (interactive)
  "nascronde la finestra corrente (tipo C-x 0  on 'delete-window'), uccidendo però anche il buffer associato, per non lasciarlo erroneamente a galla"
  (let ((selwin (selected-window)))
    (kill-buffer (window-buffer selwin))
    (delete-window selwin)))

(global-set-key "»" 'execute-extended-command) ;; italian M-x
(global-set-key "\M-#" 'async-shell-command)

(global-set-key "æ" (lambda () (interactive) (other-window 1))) ;; italian M-a
(global-set-key "\M-a" (lambda () (interactive) (other-window 1)))
(global-set-key "\M-A" (lambda () (interactive) (other-window -1)))

(global-set-key (kbd "\C-q") 'neotree-toggle)

(global-set-key (kbd "C-x C-b") (lambda ()
                                  (interactive)
                                  (beframe-buffer-menu)
                                  (other-window 1)
                                  (evil-insert-state)))
(global-set-key (kbd "C-x b") 'beframe-switch-buffer)

(global-set-key (kbd "C-c C-x C-b u") 'beframe-unassume-current-frame-buffers-selectively)
(global-set-key (kbd "C-c C-x b") 'switch-to-buffer)

(global-set-key (kbd "C-c C-x C-k") 'kill-hide)
