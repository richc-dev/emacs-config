;;; init-web.el --- Web language related config

;;; Commentary:

;;; Code:

;; PHP support
(use-package php-ts-mode
  :config
  (customize-set-variable 'treesit-font-lock-level 4))

(use-package web-mode
  :mode
  (("\\.html\\'" . web-mode)
   ("\\.js\\'" . web-mode)
   ("\\.css\\'" . web-mode)))

(provide 'init-web)
;;; init-web.el ends here
