;;; init-treesitter.el --- treesitter config
;;; Commentary:
;;; Code:

(use-package tree-sitter
  :config
  (setq treesit-language-source-alist
	'((php "https://github.com/tree-sitter/tree-sitter-php" "v0.23.12" "php/src")
	  (phpdoc "https://github.com/claytonrcarter/tree-sitter-phpdoc" "v0.1.7")
	  (html "https://github.com/tree-sitter/tree-sitter-html" "v0.23.2")
	  (css "https://github.com/tree-sitter/tree-sitter-css" "v0.25.0")
	  (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "v0.25.0")
	  (jsdoc "https://github.com/tree-sitter/tree-sitter-jsdoc" "v0.25.0")))
  (setq major-mode-remap-list
	'((php-mode . php-ts-mode))))

(provide 'init-treesitter)
;;; init-treesitter.el ends here
