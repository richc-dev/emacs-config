;; Use straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
(setq straight-use-package-by-default t ; Install packages if they don't exist unless explicitly marked
      straight-enable-package-integration nil)

;; Packages
;(use-package all-the-icons
;  :if (display-graphic-p))
(use-package magit)
(use-package projectile
  :init (projectile-mode +1)
  :bind (:map projectile-mode-map
	      ("C-c p" . projectile-command-map)))

;; - Theme
(use-package doom-themes
  :custom
  (doom-city-lights-brighter-comments t)
  :config
  (load-theme 'doom-city-lights t))


;; - Fonts
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

;; Editor
(tool-bar-mode -1) ; Disable the toolbar
(scroll-bar-mode -1) ; Disable the scroll bar
(menu-bar-mode -1) ; Disable the menu bar
(blink-cursor-mode -1) ; Disable cursor blinking
(global-display-line-numbers-mode 1) ; Always display line number in files
(hl-line-mode 1) ; Highlight the current line
(add-hook 'prog-mode-hook 'subword-mode) ; Always treat CamelCaseSubWords as seperate words
(delete-selection-mode t) ; Delete selected text when you start typing
(global-font-lock-mode t) ; Always highlight code
(show-paren-mode t) ; Indicate matching pairs of parentheses
(setq show-paren-delay 0.0
      sentence-end-double-space nil ; Don't assume sentences have two spaces after periods
      fill-column 80) ; Set default line length to 80
;; - Flyspell
(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))
(dolist (hook '(change-log-mode-hook log-edit-mode-hook))
  (add-hook hook (lambda () (flyspell-mode -1))))
;; - Flycheck
(use-package flycheck
  :init (global-flycheck-mode))
;; - Autocompletion
(use-package company
  :init (global-company-mode)
  :config
  (setq company-minimum-prefix-length 1
	company-idle-delay 0.0))
(use-package dash)
(use-package smartparens
  :init (smartparens-global-mode t))

;; Language support
(use-package emmet-mode
  :hook '(css-mode-hook sgml-mode-hook html-mode-hook))

(save-place-mode 1) ; Remember where the cursor was when opening a file
(setq default-directory "~/" ; Start looking in the home directory when opening files
      vs-follow-symlinks t) ; Always follow symlinks
;; Save minibuffer prompt history
(savehist-mode 1)
(setq history-length 25 ; Store the past 25 minibuffer commands
      savehist-autosave-interval 600 ; Save minibuffer history every 10 minutes
      history-delete-duplicates t)
;; Place automatically generated configs in custom-vars.el instead of init.el
(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)
;; Revert buffers when the open file changes
(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)
(recentf-mode 1) ; Store a list of recently opened files
(setq gc-cons-threshold 20000000 ; Allow 20MB of memory before running garbage collection
      inhibit-startup-message t ; Don't show the startup message
      initial-scratch-message nil) ; Clear scratch buffer on startup
(setq-default dired-listing-switches "-alh") ; Show file sizes in dired buffers
(fset 'yes-or-no-p 'y-or-n-p) ; Ask "y/n?" instead of "yes/no?"
(which-key-mode +1)
