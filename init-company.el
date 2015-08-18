;; venmos .emacs.d/elisp/init-company.el
;; http://venmos.com
;; venmos@fuck.gfw.es

(require 'company)

(add-hook 'after-init-hook 'global-company-mode)

(define-key global-map (kbd "M-j") 'company-complete)
(define-key global-map (kbd "C-c j") 'company-yasnippet)

;; color-theme 
(set-face-attribute
 'company-tooltip nil
 :foreground "#666666" :background "#1D1F21")
(set-face-attribute
 'company-tooltip-selection nil
 :background "#EEAD0D") 
(set-face-attribute
 'company-tooltip-common-selection nil
 :foreground "#1D1F21")
(set-face-attribute
 'company-tooltip-annotation nil
 :foreground "#89BEB7")
(set-face-attribute
 'company-tooltip-common nil
 :foreground "#EEAD0D")
(set-face-attribute
 'company-scrollbar-fg nil
 :background "#EEAD0D")
(set-face-attribute
 'company-scrollbar-bg nil
 :background "#1D1F21")

(company-mode t)

;; provide
(provide 'init-company)
;;; init-company.el ends here
