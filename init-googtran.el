;; for SpacEmacs https://github.com/syl20bnr/spacemacs
;; venmos .site-elisp/init-googtran.el
;; http://venmos.com
;; venmos@fuck.gfw.es

;; google-translate
(global-set-key (kbd "H-8") 'google-translate-smooth-translate)

(setq google-translate-translation-directions-alist
      '(("en" . "zh-CN") ("zh-CN" . "en")))

;; provide
(provide 'init-googtran)
;;; init-googtran.el end here
