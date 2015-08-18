;; venmos .emacs.d/elisp/init-google-translate.el
;; http://venmos.com
;; venmos@fuck.gfw.es

(require 'google-translate)
(require 'google-translate-smooth-ui)

(global-set-key (kbd "H-8") 'google-translate-smooth-translate)

(setq google-translate-translation-directions-alist
      '(("en" . "zh-CN") ("zh-CN" . "en")))

;; provide
(provide 'init-google-translate)
;;; init-google-translate.el ends here
