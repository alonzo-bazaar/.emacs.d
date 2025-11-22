;; ispell, idfk
(setq ispell-cmd-args '("-d" "it_IT"))

(defun flyspell-italian ()
  (interactive)
  (ispell-change-dictionary "italiano")
  (flyspell-buffer)
  (flyspell-mode 1))
