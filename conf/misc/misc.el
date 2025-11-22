;; to deal with daemon daemoning
(defun nuke-all-buffers ()
  (interactive)
  (mapc 'kill-buffer (buffer-list))
  (delete-other-windows))

;; you can use M-x eldoc-doc-buffer to see the full documenatation
;; having the thing pop up in the minibuffer all the time is visually rather noisy and just, no
(setq eldoc-echo-area-use-multiline-p 1)
