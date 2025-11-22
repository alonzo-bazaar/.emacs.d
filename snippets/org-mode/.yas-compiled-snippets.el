;;; Compiled snippets and support files for `org-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'org-mode
                     '(("u" "^{$1} $0" "up" nil nil nil
                        "/home/nil/.emacs.d/snippets/org-mode/up" nil
                        nil)
                       ("s" "\\\\sum $0" "sum" nil nil nil
                        "/home/nil/.emacs.d/snippets/org-mode/sum" nil
                        nil)
                       ("sl" "#+begin_src $1\n$0\n#+end_src" "src" nil
                        nil nil
                        "/home/nil/.emacs.d/snippets/org-mode/src" nil
                        nil)
                       ("q" "#+begin_quote\n$1\n#+end_quote\n$0\n"
                        "quote" nil nil nil
                        "/home/nil/.emacs.d/snippets/org-mode/quote"
                        nil nil)
                       ("p" "\\\\prod $0" "product" nil nil nil
                        "/home/nil/.emacs.d/snippets/org-mode/product"
                        nil nil)
                       ("ot" "\\\\tilde{$1} $0" "overtilde" nil nil
                        nil
                        "/home/nil/.emacs.d/snippets/org-mode/overtilde"
                        nil nil)
                       ("ora" "\\\\overrightarrow{$1} $0"
                        "overrightarrow" nil nil nil
                        "/home/nil/.emacs.d/snippets/org-mode/overrightarrow"
                        nil nil)
                       ("ol" "\\\\overline{$1} $0" "overline" nil nil
                        nil
                        "/home/nil/.emacs.d/snippets/org-mode/overline"
                        nil nil)
                       ("ola" "\\\\overleftarrow{$1} $0"
                        "overleftarrow" nil nil nil
                        "/home/nil/.emacs.d/snippets/org-mode/overleftarrow"
                        nil nil)
                       ("ob" "\\\\overset{\\\\bullet}{$1} $0"
                        "overbullet" nil nil nil
                        "/home/nil/.emacs.d/snippets/org-mode/overbullet"
                        nil nil)
                       ("mm" "\\\\($0\\\\)" "mathmode" nil nil nil
                        "/home/nil/.emacs.d/snippets/org-mode/mathmode"
                        nil nil)
                       ("tex"
                        "#+begin_export latex\n$1\n#+end_export\n$0"
                        "latex" nil nil nil
                        "/home/nil/.emacs.d/snippets/org-mode/latex"
                        nil nil)
                       ("i" "\\\\int $0" "integral" nil nil nil
                        "/home/nil/.emacs.d/snippets/org-mode/integral"
                        nil nil)
                       ("fra" "\\\\overset{\\\\rightarrow t}{$1} $0"
                        "frame" nil nil nil
                        "/home/nil/.emacs.d/snippets/org-mode/frame"
                        nil nil)
                       ("f" "\\\\frac{$1}{$2} $0" "fraction" nil nil
                        nil
                        "/home/nil/.emacs.d/snippets/org-mode/fraction"
                        nil nil)
                       ("d" "_{$1} $0" "down" nil nil nil
                        "/home/nil/.emacs.d/snippets/org-mode/down"
                        nil nil)
                       ("co" "~$1~ $0" "code" nil nil nil
                        "/home/nil/.emacs.d/snippets/org-mode/code"
                        nil nil)
                       ("c" "\\\\mathcal{$1} $0" "calligraphic" nil
                        nil nil
                        "/home/nil/.emacs.d/snippets/org-mode/calligraphic"
                        nil nil)
                       ("b" "\\\\mathbb{$1} $0" "blackboard" nil nil
                        nil
                        "/home/nil/.emacs.d/snippets/org-mode/blackboard"
                        nil nil)
                       ("MM" "\\\\[ $0 \\\\]" "bigmathmode" nil nil
                        nil
                        "/home/nil/.emacs.d/snippets/org-mode/bigmathmode"
                        nil nil)
                       ("bnd" "\\\\begin{${1:env}}\n$0\n\\\\end{$1}"
                        "beginend" nil nil nil
                        "/home/nil/.emacs.d/snippets/org-mode/beginend"
                        nil nil)
                       ("a" "\\\\{ $1 \\\\} $0" "array" nil nil nil
                        "/home/nil/.emacs.d/snippets/org-mode/array"
                        nil nil)))


;;; Do not edit! File generated at Fri Jul 18 10:04:06 2025
