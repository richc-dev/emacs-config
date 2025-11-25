;;; init-main.el --- Misc config that doesn't fit anywhere else

;;; Commentary:

;;; Code:

;; Packages
(use-package magit)
(use-package dashboard
  :config
  (setq dashboard-items '((recents . 5)
			  (bookmarks . 5)
			  (projects . 5))
	dashboard-display-icons-p t
	dashboard-icon-type 'nerd-icons
	dashboard-set-file-icons t
	dashboard-footer-messages '("Welcome back"))
  (dashboard-setup-startup-hook))

(use-package nerd-icons
  :custom
  (nerd-icons-font-family "Symbols Nerd Font Mono"))
(use-package nerd-icons-dired
  :hook
  (dired-mode . nerd-icons-dired-mode))

(use-package direnv
  :config
  (direnv-mode))

;; Place automatically generated configs in custom-vars.el instead of init.el
(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)
(setq gc-cons-threshold 20000000 ; Allow 20MB of memory before running garbage collection
      ring-bell-function 'ignore ; Disable annoying bell
      inhibit-startup-message t ; Don't show the startup message
      make-backup-files nil) ; Don't make backup files
(setq-default dired-listing-switches "-alh") ; Show file sizes in dired buffers

(provide 'init-main)

;;; init-main.el ends here
