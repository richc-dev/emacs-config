;;; init-theme.el --- Theme config

;;; Commentary:

;;; Code:

(use-package tron-legacy-theme
  :config
  (setq tron-legacy-theme-softer-bg t
	trong-legacy-theme-dark-fg-brighter-comments t
	tron-legacy-theme-vivid-cursor t)
  (load-theme 'tron-legacy t))

(with-no-warnings (use-package telephone-line
  :config
  (telephone-line-mode 1)))

;; Fonts
(when (member "Maple Mono Normal NF" (font-family-list))
  (set-face-attribute 'default nil :font "Maple Mono Normal NF" :height 130)
  (set-face-attribute 'fixed-pitch nil :family "Maple Mono Normal NF"))
(when (member "Rubik" (font-family-list))
  (set-face-attribute 'variable-pitch nil :family "Rubik" :height 1.18))
;;- Font Ligatures
(use-package ligature
  :config
  ; Enable all ligatures in programming modes
  (ligature-set-ligatures 'prog-mode '("<!--" "==" "===" "!=" "!==" "__" "//" "<=" ">="
				       "++" "--" "|>" ".=" "</" "</>" "/>" "!!" "??"
				       ";;" ".." "..." "||" "=>" "->"))
  ; Enable ligatures globally
  (global-ligature-mode t))

(provide 'init-theme)

;;; init-theme.el ends here
