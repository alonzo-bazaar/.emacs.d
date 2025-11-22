;;; Compiled snippets and support files for `jinja2-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'jinja2-mode
                     '(("ul" "<ul$1>\n$0\n</ul>" "ul" nil nil nil
                        "/home/nil/.emacs.d/snippets/jinja2-mode/ul"
                        nil nil)
                       ("to" "<${1:tag}>$0\n</$1>" "tagnewline" nil
                        nil nil
                        "/home/nil/.emacs.d/snippets/jinja2-mode/tagnewline"
                        nil nil)
                       ("ta" "<${1:tag}>$0</$1>" "tag" nil nil nil
                        "/home/nil/.emacs.d/snippets/jinja2-mode/tag"
                        nil nil)
                       ("p" "<p$1> $0 </p>" "p" nil nil nil
                        "/home/nil/.emacs.d/snippets/jinja2-mode/p"
                        nil nil)
                       ("li" "<li$1> $0 </li>" "li" nil nil nil
                        "/home/nil/.emacs.d/snippets/jinja2-mode/li"
                        nil nil)
                       ("h4" "<h4$1>$0</h4>" "h4" nil nil nil
                        "/home/nil/.emacs.d/snippets/jinja2-mode/h4"
                        nil nil)
                       ("h3" "<h3$1>$0</h3>" "h3" nil nil nil
                        "/home/nil/.emacs.d/snippets/jinja2-mode/h3"
                        nil nil)
                       ("h2" "<h2$1>$0</h2>" "h2" nil nil nil
                        "/home/nil/.emacs.d/snippets/jinja2-mode/h2"
                        nil nil)
                       ("h1" "<h1$1>$0</h1>" "h1" nil nil nil
                        "/home/nil/.emacs.d/snippets/jinja2-mode/h1"
                        nil nil)
                       ("dv" "\\{\\{ ${1:var} \\}\\}$0" "djangovar"
                        nil nil nil
                        "/home/nil/.emacs.d/snippets/jinja2-mode/djangovar"
                        nil nil)
                       ("dj" "\\{% ${1:tag} $0%\\}\n\\{% end$1 %\\}"
                        "djangotag" nil nil nil
                        "/home/nil/.emacs.d/snippets/jinja2-mode/djangotag"
                        nil nil)
                       ("din" "\\{% ${1:shit goes here} %\\}$0"
                        "djangoinline" nil nil nil
                        "/home/nil/.emacs.d/snippets/jinja2-mode/djangoinline"
                        nil nil)
                       ("do" "<div$1>$0\n</div>" "divnewline" nil nil
                        nil
                        "/home/nil/.emacs.d/snippets/jinja2-mode/divnewline"
                        nil nil)
                       ("di" "<div$1>$0</div>" "div" nil nil nil
                        "/home/nil/.emacs.d/snippets/jinja2-mode/div"
                        nil nil)
                       ("boilless"
                        "<!DOCTYPE html>\n<html lang=\"en\">\n  <head>\n    <meta charset=\"UTF-8\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n    <meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\">\n    <title>${1:title}</title>\n  </head>\n  <body>\n    $0\n  </body>\n</html>"
                        "boilerplateless" nil nil nil
                        "/home/nil/.emacs.d/snippets/jinja2-mode/boilless"
                        nil nil)
                       ("boil"
                        "<!DOCTYPE html>\n<html lang=\"en\">\n  <head>\n    <meta charset=\"UTF-8\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n    <meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\">\n    <title>${1:title}</title>\n    <link rel=\"stylesheet\" href=\"${2:style.css}\">\n  </head>\n  <body>\n    $0\n	<script src=\"${3:index.js}\"></script>\n  </body>\n</html>"
                        "boilerplate" nil nil nil
                        "/home/nil/.emacs.d/snippets/jinja2-mode/boil"
                        nil nil)))


;;; Do not edit! File generated at Fri Jul 18 10:04:06 2025
