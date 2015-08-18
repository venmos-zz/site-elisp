;; venmos .emacs.d/elisp/init-eww.el
;; http://venmos.com
;; venmos@fuck.gfw.es

(require 'eww)

(with-eval-after-load 'eww
  (custom-set-variables
   '(eww-search-prefix "https://www.google.com.hk/search?q=%s"))
    (define-key eww-mode-map (kbd "f") 'eww-forward-url)
		(define-key eww-mode-map (kbd "b") 'eww-back-url)
		(define-key eww-mode-map (kbd "l") 'ace-link-eww)
		(define-key eww-mode-map (kbd "n") 'next-line)
		(define-key eww-mode-map (kbd "p") 'previous-line)
		(define-key eww-mode-map (kbd "j") 'cua-scroll-up)
		(define-key eww-mode-map (kbd "k") 'cua-scroll-down)
		(define-key eww-mode-map (kbd "/") 'highlight-regexp)
		(define-key eww-mode-map (kbd "r") 'eww-reload)
		(define-key eww-mode-map (kbd "G") 'eww)
		(define-key eww-mode-map (kbd "h") 'eww-list-histories)
  )

(setq eww-download-directory "~/Downloads")
(setq eww-form-checkbox-symbol "[ ]")
(setq eww-form-checkbox-selected-symbol "[X]")

;; provide
(provide 'init-eww)
;;; init-w3m.el ends here
