(use-package uiua-mode
  :defer t
  :ensure t
  :mode "\\.ua\\'")

;; adapting
;; https://www.masteringemacs.org/article/comint-writing-command-interpreter
;; to have a comint mode for uiua

;; gotta run these first if you're testing this in an emacs -q window
;; (require 'package)
;; (package-initialize)
(require 'uiua-mode)
(require 'comint)

(defvar uiua-program "uiua"
  "Path to the program used by `run-uiua'")

(defvar uiua-cli-arguments '("repl")
  "Commandline arguments to pass to `uiua'.")

(defvar uiua-interactive-mode-map
  (let ((map (append (make-sparse-keymap) uiua-mode-map comint-mode-map)))
    ;; example definition
    (define-key map "\t" 'completion-at-point)
    map)
  "Basic mode map for `run-uiua'.")

(defvar uiua-prompt-regexp "^[[:space:]]+"
  "Prompt for `run-uiua'.")

(defvar uiua-repl-buffer-name "*UIUA*"
  "Name of the buffer to use for the `run-uiua' comint instance.")

;; TODO: add uiua-mode keywords andh highlighint to uiua-interactive-mode 
(defun run-uiua ()
  "Run an inferior instance of `uiua' inside Emacs."
  (interactive)
  (let* ((uiua-program uiua-program)
         (buffer (get-buffer-create uiua-repl-buffer-name))
         (proc-alive (comint-check-proc buffer))
         (process (get-buffer-process buffer)))
    ;; if the process is dead then re-create the process and reset the
    ;; mode.
    ;; (or if it's your first time running it, I suppose)
    (unless proc-alive
      (with-current-buffer buffer
        (apply 'make-comint-in-buffer "Uiua" buffer
               uiua-program nil uiua-cli-arguments)
        (uiua-interactive-mode)))
    ;; Regardless, provided we have a valid buffer, we pop to it.
    (when buffer
      (pop-to-buffer buffer))))

(defun uiua-interactive--initialize ()
  "Helper function to initialize uiua repl."
  (setq comint-process-echoes t)
  (setq comint-use-prompt-regexp t))

(defun nil/space-all-white (str)
  (cl-do ((i 0 (1+ i)))
	  ((= i (length str)))
	(when (or (= (aref str i) ?\n)
			  (= (aref str i) ?\r)
			  (= (aref str i) ?\t))
	  (setf (aref str i) ?\s)))
  str)

(defun nil/region-as-string ()
  (buffer-substring-no-properties (region-beginning) (region-end)))

;; https://emacs.stackexchange.com/questions/37887/send-region-to-shell-in-another-buffer
;; the newline at the end is because it seems to receive the input but not print the output otherwise

(defun uiua-send-region (&optional prefix)
  "send region to uiua repl
if called with a prefix (C-u before calling) it joins the entire region
in one line before sending it to prefix
this is done as a (hopefully) temporary measure while I figure out why
does regular uiua-interactive-mode hate multiline input

this latter prefix behaviour might fuck with a couple things,
such as multiline strings and some style warnings here and there for long lines
which is, as of writing, not my problem"
  (interactive "P")
  (if (use-region-p)
      (let* ((buffer (get-buffer-create uiua-repl-buffer-name))
             (proc-alive (comint-check-proc buffer))
             (process (get-buffer-process buffer)))
        (if (and proc-alive buffer)
			(let ((cmd (nil/region-as-string)))
			  (when prefix
				(setq cmd (nil/space-all-white cmd)))
			  (comint-send-string uiua-repl-buffer-name cmd)
			  (comint-send-string uiua-repl-buffer-name "\n"))
          (message "No repl running")))
    (message "No region active")))

;; stolen from github
(defun casuiua-send-region-to-repl ()
  (interactive "r")
  (if (use-region-p)
      (let* ((buffer (get-buffer-create uiua-repl-buffer-name))
             (proc-alive (comint-check-proc buffer))
             (process (get-buffer-process buffer)))
        (if (and proc-alive buffer)
            (progn
              (comint-send-region process region-start region-end)
              (comint-send-string process "\n"))
          (message "No repl running")))
    (message "No region active")))

(define-derived-mode uiua-interactive-mode comint-mode "Uiua Interactive"
  "Majore mode for `run-uiua'.
\\<uiua-interactive-mode-map>"
  :syntax-table uiua--syntax-table
  :group 'uiua

  ;; this sets up the prompt so it matches things like: [foo@bar]
  (setq comint-prompt-regexp uiua-prompt-regexp)
  ;; this makes it read only; a contentious subject as some prefer the
  ;; buffer to be overwritable.
  (setq comint-prompt-read-only t)
  ;; this makes it so commands like M-{ and M-} work.
  (set (make-local-variable 'paragraph-separate) "\\'")
  (set (make-local-variable 'paragraph-start) uiua-prompt-regexp))

(add-hook 'uiua-interactive-mode-hook 'uiua-interactive--initialize)

;; personal settings for uiua and uiua-interactive-mode
;; keybinds
(add-hook 'uiua-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c C-c") 'uiua-send-region)
            (local-set-key (kbd "C-c C-x C-f") 'uiua-format-buffer)
            (local-set-key (kbd "C-c C-x C-r") 'uiua-format-region)
            (local-set-key (kbd "C-c C-x C-c") 'uiua-standalone-compile)
            ))

;; wip
;; (define-key uiua-mode-map (kbd "<tab>")
;;             (lambda ()
;;               (interactive)
;;               (push-mark)
;;               (backward-word)
;;               (uiua-format-region (region-beginning) (region-end))
;;               (pop-mark)
;;               ))

;; (local-set-key (kbd "<tab>") (lambda ()
;;                                (interactive)
;;                                (save-excursion
;;                                  (set-mark-command (point))
;;                                  (backward-word)
;;                                  (uiua-format-region (region-beginning) (region-end)))))

;; lsp
;; (add-hook 'uiua-mode-hook 'eglot-ensure)


;; TODO: see why RET turns to comint the moment I turn on this fucking uiua scheisse
;; I nconc'd the fucking mode maps together :|
