(defvar theme-hooks-alist
  '(
    (doom-opera  (lambda ()
  		           (progn
  		             (setq doom-opera-comment-bg t)
  		             (set-face-foreground 'font-lock-comment-face "#bfbfbf"))))
    (doom-nord-aurora 
     (lambda ()
  	   (progn
		 (setq doom-nord-aurora-comment-bg t)
		 (setq doom-nord-aurora-region-highlight t)
		 (set-face-foreground 'font-lock-comment-delimiter-face "#90a0b0")
  		 (set-face-foreground 'font-lock-comment-face "#bbccdd"))))
    (nord 
     (lambda ()
  	   (progn
		 (set-face-foreground 'font-lock-comment-delimiter-face "#a0b0c0")
  		 (set-face-background 'font-lock-comment-face "#ccddee"))))
    (doom-zenburn 
     (lambda ()
  	   (progn
  		 (setq doom-zenburn-comment-bg t)
  		 (set-face-background 'show-paren-match "#7f8f9f"))))
    (doom-one 
     (lambda ()
  	   (progn
  		 (set-face-foreground 'font-lock-comment-face "#c2c2c2"))))
    (rose-pine-moon 
     (lambda ()
  	   (progn
  		 (set-face-foreground 'font-lock-comment-face "#c2c2c2"))))
    (doom-rose-pine
     (lambda ()
  	   (progn
		 (set-face-foreground 'font-lock-comment-delimiter-face "#8090a0")
  		 (set-face-foreground 'font-lock-comment-face "#aabbcc"))))
    ))

(defun run-theme-hooks (theme)
  (let ((hooks-cons (assoc theme theme-hooks-alist)))
    (when hooks-cons
      (dolist (hook (cdr hooks-cons))
  	(funcall hook)))))
