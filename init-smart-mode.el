;; venmos .emacs.d/elisp/init-smart-mode.el
;; http://venmos.com
;; me[at]venmos.com

(sml/setup)
(setq sml/no-confirm-load-theme t)

;; work path
(add-to-list 'sml/replacer-regexp-list '("^~/.my-project/GitLab/" ":GL"))
(add-to-list 'sml/replacer-regexp-list '("^~/.my-project/Github/" ":GH:"))
(add-to-list 'sml/replacer-regexp-list '("^~/.emacs.d/Org-Mode/" ":WK:"))

;; provide
(provide 'init-smart-mode)
;;; init-smart-mode.el ends here
