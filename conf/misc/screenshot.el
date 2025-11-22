(defun scrin ()
  (interactive)
  (cond ((wayland-p) (start-process "wayland-screenshot" nil "wayscrin"))
        ((xorg-p) (start-process "screenshot" nil "scrin"))))

(defun scrinclip ()
  (interactive)
  (cond ((wayland-p) (start-process "wayland-crop-screenshot" nil "wayscrinclip" (expand-file-name ".")))
        ((xorg-p) (start-process "crop-screenshot" nil "scrinclip" (expand-file-name ".")))))

(defun scrinpath ()
  (interactive)
  (cond ((wayland-p) (start-process "wayland-crop-screenshot" nil "wayscrinclippath" (expand-file-name ".")))
        ((xorg-p) (start-process "crop-screenshot" nil "scrinclippath" (expand-file-name ".")))))
