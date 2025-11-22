(defun prompt-me-a-directory (prompt)
  (expand-file-name (read-file-name prompt default-directory default-directory
                  nil nil 'directory-name-p)))

(defun prompt-me-file-or-shit (prompt)
  (expand-file-name (read-file-name prompt default-directory default-directory nil nil nil)))

(defun mklist (elt)
  (if (consp elt)
      elt
    (list elt)))

(defun out-shell (shell)
  (let ((default-directory (prompt-me-a-directory (concat "open " shell " to : ")))
        (terminal-program (if (wayland-p) "foot" "st")))
    (start-process "terminal" nil terminal-program "-e" shell)))

(defun out-fish () (interactive) (out-shell "fish"))
(defun out-zsh () (interactive) (out-shell "fish"))
(defun out-bash () (interactive) (out-shell "bash"))

(defmacro defprompt (name &optional prompt command)
  (let ((proc-name (symbol-name name))
	(prompt (or prompt "file : "))
	(command (or command '("ls"))))
    `(defun ,name ()
       (interactive)
       (let ((file (prompt-me-file-or-shit ,prompt)))
	 ,(append `(start-process ,proc-name nil) (mklist command) (list 'file))))))

;; if you want to use mupdf, xreader, firefox... change this variable
;; TODO vedi se fare C-u m M-x outer-pdf magari puoi impostarlo col prefisso
;; per girare con mupdf invece di zathura, se andasse di cambiare ogni tanto
(defvar out-pdf-reader "zathura")
(defvar out-image-viewer "imv")
(defvar out-image-editor "pinta")
(defvar out-doc-annotation "xournalpp")
(defvar out-browser "firefox")
(defvar out-file-manager "pcmanfm")
(defprompt out-pdf "apri pdf : " out-pdf-reader)
(defprompt out-evince "apri pdf (enince) : " "evince")
;; works better for hella hyperlinky documents
(defprompt out-image "apri immagine : " out-image-viewer)
(defprompt out-image-edit "modifica immagine : " out-image-editor)
(defprompt out-annotate "annota documento : " out-doc-annotation)
(defprompt out-browse "apri nel browser : " out-browser)
(defprompt out-chromium "apri in chromium : " "chromium-browser")
(defprompt out-uml "open uml : " "staruml")
(defprompt out-vscode "tira editor di merda su : " "codium")
(defprompt out-file "apri in file manager : " out-file-manager)
(defprompt out-office "apri con office : " "libreoffice")
(defprompt out-presentation "apri presentazione : " ("soffice" "-show"))

;; put these bad boys with some beframe and we rolling in dough
(defprompt mitosis "new emacs frame to : "  ("emacsclient" "--create-frame"))
(defun mitosis-shell () (interactive) (start-process "shite" nil "fuckitol"))
(defun mitosis-sly () (interactive) (start-process "shite-sly" nil "fuckitol-sly"))
(defun mitosis-python () (interactive) (start-process "shite-sly" nil "fuckitol-py"))

;; TODO define a general "dired-out-at-point" that opens the file at point
;; with a program determined t runtime given the file extension
;; TODOx2 see if such functionality already exists, otherwise have fun
(defun image-at-point ()
  (interactive)
  (start-process "image" nil out-image-viewer (dired-get-file-for-visit)))
(defun pdf-at-point ()
  (interactive)
  (start-process "pdf" nil out-pdf-reader (dired-get-file-for-visit)))
