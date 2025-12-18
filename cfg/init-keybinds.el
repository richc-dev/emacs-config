;;; init-keybinds.el --- defines custom keybinds
;;; Commentary:
;;; Code:

(use-package ryo-modal
  :commands ryo-modal-mode
  :bind ("C-`" . ryo-modal-mode)
  :config
  (ryo-modal-keys
   ("q" ryo-modal-mode)
   ("h" "C-b")
   ("j" "C-n")
   ("k" "C-p")
   ("l" "C-f"))

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
