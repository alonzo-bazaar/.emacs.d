;; TODO add a variable muh-display-server that keeps track of this info
;; and is modified during bro-update-env (or (defun bro-update-dispaly-server))
(defun wayland-p () (string= (getenv "XDG_SESSION_TYPE") "wayland"))
(defun xorg-p () (not (wayland-p)))
;; and, since we need them enviroment variables up to date
;; https://emacs.stackexchange.com/questions/6104/reload-environment-variables
;; TODO maybe just update the display server?
(defun bro-update-env (filename)
  (let ((str (with-temp-buffer (insert-file-contents filename)
                               (buffer-string))))
    (cl-do ((lst (split-string str "\000") (cdr lst)))
        ((not lst) "ight done, it's updated")
      (let ((curr (car lst)))
        (when (string-match "^\\(.*?\\)=\\(.*\\)" curr)
          (let ((variable (match-string 1 curr)) ; first paren in regex captures var
                (value (match-string 2 curr)))   ; second paren caputres value
            (setenv variable value)))))))
