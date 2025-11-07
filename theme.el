;; Colors
(use-package doom-themes
  :custom
  (doom-city-lights-brighter-comments t)
  :config
  (load-theme 'doom-city-lights t))

;; Fonts
(when (member "Maple Mono Normal NF" (font-family-list))
  (set-face-attribute 'default nil :font "Maple Mono Normal NF" :height 130)
  (set-face-attribute 'fixed-pitch nil :family "Maple Mono Normal NF"))
(when (member "Rubik" (font-family-list))
  (set-face-attribute 'variable-pitch nil :family "Rubik" :height 1.18))
;; - - Font Ligatures
(use-package ligature
  :config
  ; Enable all ligatures in programming modes
  (ligature-set-ligatures 'prog-mode '("<!--" "==" "===" "!=" "!==" "__" "//" "<=" ">="
				       "++" "--" "|>" ".=" "</" "</>" "/>" "!!" "??"
				       ";;" ".." "..." "||" "=>" "->"))
  ; Enable ligatures globally
  (global-ligature-mode t))
