(defun pidof-p (program)
  (= 0 (call-process "pidof" nil nil nil "-q" program)))

(defvar muh-light-theme)
(defvar muh-dark-theme)
(defvar last-visited-wm "")

(defvar wm-themes-alist
  '(("sway" doom-one doom-one-light)
    ("awesome" everforest-hard-dark everforest-hard-light)
    ("stumpwm" ef-autumn ef-melissa-light)
    ("xmonad" doom-rose-pine doom-rose-pine-dawn)))

(defvar muh-default-dark-theme 'ef-autumn)
(defvar muh-default-light-theme 'ef-melissa-light)

(defun set-theme-based-on-wm-alist (alist)
  (cond ((null alist)
         (setq muh-dark-theme muh-default-dark-theme)
         (setq muh-light-theme muh-default-light-theme))
        ((pidof-p (caar alist))
         (setq last-visited-wm (caar alist))
         (setq muh-dark-theme (cadar alist))
         (setq muh-light-theme (caddar alist)))
        (t (set-theme-based-on-wm-alist (cdr alist)))))

(defun set-theme-based-on-wm (&optional check-last-visited)
  (unless (and check-last-visited (pidof-p last-visited-wm))
    (set-theme-based-on-wm-alist wm-themes-alist)))
