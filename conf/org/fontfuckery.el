(defun org-like-em-big ()
  (interactive)
  (set-face-attribute 'org-level-1 nil :height 2.00)
  (set-face-attribute 'org-level-2 nil :height 1.75)
  (set-face-attribute 'org-level-3 nil :height 1.50)
  (set-face-attribute 'org-level-4 nil :height 1.25))

(defun org-like-em-small ()
  (interactive)
  (set-face-attribute 'org-level-1 nil :height 1.00)
  (set-face-attribute 'org-level-2 nil :height 1.00)
  (set-face-attribute 'org-level-3 nil :height 1.00)
  (set-face-attribute 'org-level-4 nil :height 1.00))

(defun org-like-em-font (font-1 font-2 font-3 font-al)
  (set-face-attribute 'org-level-1 nil :font font-1)
  (set-face-attribute 'org-level-2 nil :font font-2)
  (set-face-attribute 'org-level-3 nil :font font-3)
  (set-face-attribute 'org-level-4 nil :font font-al)
  (set-face-attribute 'org-level-5 nil :font font-al)
  (set-face-attribute 'org-level-6 nil :font font-al)
  (set-face-attribute 'org-level-7 nil :font font-al)
  (set-face-attribute 'org-level-8 nil :font font-al))

(defvar nil/font-height-alist-shit '(
				     ("Fairfax Hax HD" . 160)
				     ("Fairfax HD" . 160)
				     ("Fairfax" . 160)
				     ("BQN386 Unicode" . 135)
				     ("Fantasque Sans Mono" . 160)
				     ("Jetbrains Mono" . 140)
				     ;; last resort
				     ;; NOTO SANS MONO FUCK YOU
				     ("Noto Sans Mono" . 135)
				     ))

(defun nil/pick-font-and-height (alist)
  (cond ((null alist) ("Fantasque Sans Mono" . 160))
		((x-list-fonts (caar alist)) (car alist))
		(t (nil/pick-font-and-height (cdr alist)))))

(defun font-like-em-normal ()
  (interactive)
  (let* ((font-and-height (nil/pick-font-and-height nil/font-height-alist-shit))
		 (font (car font-and-height))
		 (height (cdr font-and-height)))
  (set-face-attribute 'default nil
                      :font font :height height
		              :weight 'normal)))

(defun font-like-em-wack ()
  (interactive)
  (let ((family "F25 Blackletter Typewriter") (height 160))
    (set-face-attribute 'default nil
                        :font family :height height
		                :weight 'normal)
    
    (org-like-em-font
     "Rothenburg Decorative"
     "Dearest"
     "Kingthings Spikeless"
     "Kingthings Spikeless")
    (org-like-em-big)))

(add-hook 'org-mode-hook 'org-like-em-big)
