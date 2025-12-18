;;; init-web.el --- Web language related config

;;; Commentary:

;;; Code:

;; PHP support
(use-package php-mode)
(use-package phpstan)
(use-package flycheck-phpstan
  :after (flycheck phpstan))

(with-no-warnings (use-package web-mode
  :mode
  (("\\.html\\'" . web-mode)
   ("\\.js\\'" . web-mode)
   ("\\.css\\'" . web-mode))))

(provide 'init-web)
;;; init-web.el ends here
