;; venmos .emacs.d/elisp/init-file.el
;; http://venmos.com
;; venmos@fuck.gfw.es


;; file-ruby-mode
(add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.rjs\\'" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.rhtml\\'" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))

;; file-markdown-mode
(defun forbidden-markdown-mode-key ()
  (define-key markdown-mode-map (kbd "<tab>") nil))
(add-hook 'markdown-mode-hook 'forbidden-markdown-mode-key)

;; file-nxml-mode
(add-to-list 'auto-mode-alist '("\\.plist" . nxml-mode))

;; provide
(provide 'init-file)
;;; init-file.el ends here
