;; venmos .emacs.d/elisp/init-ace-jump-mode.el
;; http://venmos.com
;; venmos@fuck.gfw.es


(autoload
  'ace-jump-mode
  "ace-jump-mode" 1)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))


(define-key global-map (kbd "H-x") 'ace-jump-mode)
(define-key global-map (kbd "H-z") 'ace-jump-mode-pop-mark)

;; provide
(provide 'init-ace-jump-mode)
;;; init-ace-jump-mode.el ends here
