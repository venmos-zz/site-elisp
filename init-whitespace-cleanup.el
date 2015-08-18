;; venmos .emacs.d/elisp/init-whitespace-cleanup.el
;; http://venmos.com
;; venmos@fuck.gfw.es

(global-set-key "\C-c_w" 'whitespace-mode)
(global-set-key "\C-c=w" 'global-whitespace-mode)

(add-hook 'ssh-mode-hook 'whitespace-mode)

;; provide
(provide 'init-whitespace-cleanup)
;;; init-whitespace-cleanup.el ends here
