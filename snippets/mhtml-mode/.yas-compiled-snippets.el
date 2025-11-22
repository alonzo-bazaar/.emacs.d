;;; Compiled snippets and support files for `mhtml-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'mhtml-mode
                     '(("to" "<${1:tag}>$0\n</$1>" "tagnewline" nil
                        nil nil
                        "/home/nil/.emacs.d/snippets/mhtml-mode/tagnewline"
                        nil nil)
                       ("ta" "<${1:tag}>$0</$1>" "tag" nil nil nil
                        "/home/nil/.emacs.d/snippets/mhtml-mode/tag"
                        nil nil)
                       ("dv" "\\{\\{ ${1:var} \\}\\}$0" "djangovar"
                        nil nil nil
                        "/home/nil/.emacs.d/snippets/mhtml-mode/djangovar"
                        nil nil)
                       ("dj" "\\{% ${1:tag} $0%\\}\n\\{% end$1 %\\}"
                        "djangotag" nil nil nil
                        "/home/nil/.emacs.d/snippets/mhtml-mode/djangotag"
                        nil nil)
                       ("do" "<div$1>$0\n</div>" "divnewline" nil nil
                        nil
                        "/home/nil/.emacs.d/snippets/mhtml-mode/divnewline"
                        nil nil)
                       ("di" "<div$1>$0</div>" "div" nil nil nil
                        "/home/nil/.emacs.d/snippets/mhtml-mode/div"
                        nil nil)))


;;; Do not edit! File generated at Fri Jul 18 10:04:06 2025
