;; venmos .emacs.d/elisp/init-multiple-cursors.el
;; http://venmos.com
;; venmos@fuck.gfw.es

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "H->") 'mc/mark-next-like-this)
(global-set-key (kbd "H-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; provide
(provide 'init-multiple-cursors)
;;; init-multiple-cursors.el ends here
