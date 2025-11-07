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
(setq straight-use-package-by-default t ; Automatically install packages unless told not to
      straight-enable-package-integration nil)

;; Packages
;(use-package all-the-icons
;  :if (display-graphic-p))
(use-package magit)
(use-package projectile
  :init (projectile-mode +1)
  :bind (:map projectile-mode-map
	      ("C-c p" . projectile-command-map)))

;; Language support
(use-package emmet-mode
  :hook '(css-mode-hook sgml-mode-hook html-mode-hook))

;; Place automatically generated configs in custom-vars.el instead of init.el
(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)
(setq gc-cons-threshold 20000000 ; Allow 20MB of memory before running garbage collection
      inhibit-startup-message t ; Don't show the startup message
      make-backup-files nil) ; Don't make backup files
(setq-default dired-listing-switches "-alh") ; Show file sizes in dired buffers

;; Load other config files
(let ((default-directory user-emacs-directory))
  (load (expand-file-name "theme.el"))
  (load (expand-file-name "editor.el"))
  (load (expand-file-name "minibuffer.el")))

;;; init.el ends here
