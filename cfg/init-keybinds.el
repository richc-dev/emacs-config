;;; init-keybinds.el --- defines custom keybinds
;;; Commentary:
;;; Code:

(use-package ryo-modal
  :commands ryo-modal-mode
  :bind ("C-;" . ryo-modal-mode)
  :config
  (ryo-modal-key "SPC" '(("SPC" "C-SPC")
			 ("d" mark-defun :name "Mark defun")
			 ("p" mark-paragraph :name "Mark paragraph")
			 ("s" mark-sexp :name "Mark sexp")
			 ("w" mark-word :name "Mark word")))
  (ryo-modal-keys
   ("/" "C-/")
   ("a" "C-a")
   ("b" "C-b")
   ("d" "C-d")
   ("e" "C-e")
   ("f" "C-f")
   ("k" (("d" mark-defun :name "Kill defun")
	 ("k" "C-k")
	 ("p" mark-paragraph :name "Kill paragraph")
	 ("s" mark-sexp :name "Kill sexp")
	 ("w" mark-word :name "Kill word"))
    :then '(kill-region))
   ("l" "C-l")
   ("n" "C-n")
   ("p" "C-p")
   ("q" ryo-modal-mode)
   ("v" "C-v")
   ("x" (("b" "C-x b")
	 ("k" "C-x k")
	 ("p" (("f" "C-x p f")))
	 ("s" "C-x C-s"))))

  (ryo-modal-keys
   (:norepeat t)
   ("0" "M-0")
   ("1" "M-1")
   ("2" "M-2")
   ("3" "M-3")
   ("4" "M-4")
   ("5" "M-5")
   ("6" "M-6")
   ("7" "M-7")
   ("8" "M-8")
   ("9" "M-9")))

(bind-keys
 :map global-map
 
 ;; smartparens keybinds
 :map smartparens-mode-map
 ("C-M-a" . sp-beginning-of-sexp)
 ("C-M-e" . sp-end-of-sexp)
 ;; CIDER keybinds
 :map cider-repl-mode-map
 ("RET" . cider-repl-return))

 (provide 'init-keybinds)

;;; init-keybinds.el ends here
