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
(setq sentence-end-double-space nil ; Don't assume sentences have two spaces after periods
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
;; - Highlight matching parenthesis
(show-paren-mode 1)
(setq show-paren-delay 0.0
      show-paren-when-point-inside-paren t)

(use-package dash) ;; Required by smartparens
(use-package smartparens
  :init (smartparens-global-mode t))

;; Revert buffers when the open file changes
(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)

;; Highlight indentation
(use-package highlight-indentation
  :config
  (add-hook 'python-mode-hook 'highlight-indentation-mode)
  (add-hook 'python-mode-hook 'highlight-indentation-current-column-mode))

(save-place-mode 1) ; Remember where the cursor was when opening a file
