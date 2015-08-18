;; venmos .emacs.d/elisp/init-emacs-chrome.el
;; http://venmos.com
;; venmos@fuck.gfw.es

;; load-path
(add-to-list 'load-path "~/.emacs.d/plugin/emacs_chrome/servers")
(require 'edit-server)
;; configure
(when (require 'edit-server nil t)
  (setq edit-server-new-frame nil)
  (edit-server-start))

(setq edit-server-url-major-mode-alist
      '(("github\\.com" . markdown-mode)
				("segmentfault\\.com" . markdown-mode)
				))

;; provide
(provide 'init-emacs-chrome)
;;; init-weibo.el ends here
