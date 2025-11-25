;;; init.el --- Loads the config

;;; Commentary:

;;; Code:

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

;; Load other config files
(let ((default-directory (expand-file-name "cfg" user-emacs-directory)))
  (add-to-list 'load-path default-directory)
  (normal-top-level-add-subdirs-to-load-path))

(require 'init-editor)
(require 'init-main)
(require 'init-theme)
(require 'init-keybinds)
(require 'init-minibuffer)
(require 'init-python)

;;; init.el ends here
