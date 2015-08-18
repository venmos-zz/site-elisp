;; venmos .emacs.d/elisp/init-ido.el
;; http://venmos.com
;; venmos@fuck.gfw.es

(require 'ido-ubiquitous)
(require 'idomenu)

(ido-mode 1)
(ido-everywhere t)
(ido-ubiquitous-mode t)
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point nil)
(setq ido-auto-merge-work-directories-length 0)
(setq ido-use-virtual-buffers t)
(setq ido-default-buffer-method 'selected-window)

;; smex
(smex-initialize)
(global-set-key "\M-x" 'smex)

(add-to-list 'ido-ignore-files "\\.DS_Store")

;; provide
(provide 'init-ido)
;;; init-do.el ends here
