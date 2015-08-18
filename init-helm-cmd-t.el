;; venmos .emacs.d/elisp/init-helm-cmd-t.el
;; http://venmos.com
;; venmos@fuck.gfw.es

(require 'helm-cmd-t)

(setq helm-ff-lynx-style-map nil
      helm-input-idle-delay 0.1
      helm-idle-delay 0.1)

(global-set-key (kbd "H-t") 'helm-cmd-t)

(setq helm-ff-transformer-show-only-basename nil)

;; provide
(provide 'init-helm-cmd-t)
;;; init-helm-cmd-t.el ends here
