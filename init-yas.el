;; for SpacEmacs https://github.com/syl20bnr/spacemacs
;; venmos .site-elisp/init-yas.el
;; http://venmos.com
;; venmos@fuck.gfw.es

(require 'yasnippet)
;(yas-global-mode t)

(yas/load-directory "~/.site-elisp/plugin/yasnippets")
(setq yas-snippets-dir (expand-file-name "~/.site-elisp/plugin/yasnippets"))

;; provide
(provide 'init-yas)
;;; init-yasnippet.el ends here
