(defun disable-all-themes ()
  (dolist (th custom-enabled-themes)
    (disable-theme th)))

(defun change-theme-nonint (theme)
  ;; TODO, undo dei hook già runnati
  ;; la cosa potrebbe richiedere struct ad hoc,
  ;; o il caricamemento e disabilitazione di "sottotemi" custom
  ;; tanto hai già il wrapper, ci vuole poco, aggiungere tipo un
  ;; (pop-all-face-attributes)
  (disable-all-themes)
  (load-theme theme t)
  (run-theme-hooks theme))

(defun change-theme ()
  (interactive)
  (let ((themestr (completing-read
		   "Change to custom theme : "
		   (mapcar #'symbol-name (custom-available-themes)))))
    (change-theme-nonint (intern themestr))))

(defun going-light () (interactive) (change-theme-nonint muh-light-theme))
(defun going-dark () (interactive) (change-theme-nonint muh-dark-theme))
(defun back-to-insanity () (interactive) (disable-all-themes))
