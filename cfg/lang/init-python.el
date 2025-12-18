;;; init-python.el --- Python related config

;;; Commentary:

;;; Code:

;; Show indentation
(use-package indent-bars
  :hook ((python-mode) . indent-bars-mode))

(provide 'init-python)

;;; init-python.el ends here
