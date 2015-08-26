;; for SpacEmacs https://github.com/syl20bnr/spacemacs
;; venmos .site-elisp/init-eww.el
;; http://venmos.com
;; venmos@fuck.gfw.es

(require 'eww)

(with-eval-after-load 'eww
  (custom-set-variables
   '(eww-search-prefix "https://www.google.com.hk/search?q="))
  (define-key eww-mode-map (kbd "f") 'eww-forward-url)
  (define-key eww-mode-map (kbd "b") 'eww-back-url)
  (define-key eww-mode-map (kbd "f") 'ace-link-eww)
  (define-key eww-mode-map (kbd "j") 'next-line)
  (define-key eww-mode-map (kbd "k") 'previous-line)
  (define-key eww-mode-map (kbd "n") 'scroll-up-command)
  (define-key eww-mode-map (kbd "p") 'scroll-down-command)
  (define-key eww-mode-map (kbd "/") 'highlight-regexp)
  (define-key eww-mode-map (kbd "r") 'eww-reload)
  (define-key eww-mode-map (kbd "o") 'eww)
  (define-key eww-mode-map (kbd "h") 'eww-list-histories)
  )

(setq eww-download-directory "~/Downloads")
(setq eww-form-checkbox-symbol "[ ]")
(setq eww-form-checkbox-selected-symbol "[X]")

;; provide
(provide 'init-eww)
;;; init-eww.el ends here
