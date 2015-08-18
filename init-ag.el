;; venmos .emacs.d/elisp/init-ag.el
;; http://venmos.com
;; venmos@fuck.gfw.es

;; configuration
(setq ag-highlight-search t)
(setq ag-reuse-window 't)
(setq ag-reuse-buffers 't)
(global-set-key (kbd "H-f") 'helm-ag)

;; provide
(provide 'init-ag)
;;; init-ag.el ends here
