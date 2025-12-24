;;; init-editor.el --- config for default editor behaviour

;;; Commentary:

;;; Code:

(use-package emacs
  :hook
  (prog-mode . display-fill-column-indicator-mode)
  :config
  (save-place-mode 1) ; Remember where the cursor was when opening a file
  (tool-bar-mode -1) ; Disable the toolbar
  (scroll-bar-mode -1) ; Disable the scroll bar
  (menu-bar-mode -1) ; Disable the menu bar
  (blink-cursor-mode -1) ; Disable cursor blinking
  (global-display-line-numbers-mode 1) ; Always display line number in files
  (hl-line-mode 1) ; Highlight the current line
  (add-hook 'prog-mode-hook 'subword-mode) ; Always treat CamelCaseSubWords as seperate words
  (delete-selection-mode t) ; Delete selected text when you start typing
  (global-font-lock-mode t) ; Always highlight code
  (setq sentence-end-double-space nil) ; Don't assume sentences have two spaces after periods
  (setq-default	fill-column 80) ; Set default line length to 80

  ;; Highlight matching parenthesis
  (show-paren-mode 1)
  (setq show-paren-delay 0.0
	show-paren-when-point-inside-paren t)

  ;; Revert buffers when the open file changes
  (global-auto-revert-mode 1)
  (setq global-auto-revert-non-file-buffers t))

;; Flyspell
(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))
(dolist (hook '(change-log-mode-hook log-edit-mode-hook))
  (add-hook hook (lambda () (flyspell-mode -1))))

;; Flycheck
(use-package flycheck
  :init (global-flycheck-mode))
;; - Allow Flycheck to work with Eglot
(use-package flycheck-eglot
  :after (flycheck eglot)
  :config
  (global-flycheck-eglot-mode 1))

(use-package dash) ;; Required by smartparens
(use-package smartparens
  :init (smartparens-global-mode t))

;; Visualize indentation
(use-package indent-bars
  :hook ((yaml-mode) . indent-bars-mode))

;; Indicate which lines have been changed
(use-package line-reminder
  :config
  (setq line-reminder-show-option 'indicators)
  (global-line-reminder-mode t))

(use-package git-gutter
  :config
  (global-git-gutter-mode t))

;; Follow .editorconfig files
(use-package editorconfig
  :config
  (editorconfig-mode 1))

(use-package markdown-mode)

(provide 'init-editor)

;;; init-editor.el ends here
