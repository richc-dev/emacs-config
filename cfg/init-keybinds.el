;;; keybinds.el --- defines custom keybinds

;;; Commentary:

;;; Code:

(bind-keys
  :map global-map
  ("C-j" . backward-char)
  ("C-;" . forward-char)
  ("C-k" . next-line)
  ("C-l" . previous-line)
  ("M-k" . forward-word)
  ("M-j" . backward-word)
  ("M-'" . dabbrev-expand)
  ("C-p" . electric-newline-and-maybe-indent)
  ("C-f" . kill-line)
  ("C-n" . recenter-top-bottom)
  ("M-p" . default-indent-new-line)
  ("M-f" . kill-sentence)
  ("M-/" . comment-dwim)
 ;; smartparens keybinds
 :map smartparens-mode-map
 ("C-M-a" . sp-beginning-of-sexp)
 ("C-M-e" . sp-end-of-sexp))

 (provide 'init-keybinds)

;;; keybinds.el ends here
