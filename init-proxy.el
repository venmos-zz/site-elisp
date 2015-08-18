;; venmos .emacs.d/elisp/init-ace-jump-mode.el
;; http://venmos.com
;; me[at]venmos.com

;; emacs proxy services
(setq url-using-proxy t)
    (setq url-proxy-services '(
															 ("http"   . "127.0.0.1:1080")
															 ("https"  . "127.0.0.1:1080")
							))
;; provide
(provide 'init-proxy)
;;; init-ace-jump-mode.el ends here
