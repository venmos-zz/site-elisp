;; venmos .emacs.d/elisp/init-fiplr.el
;; http://venmos.com
;; venmos@fuck.gfw.es

(setq fiplr-ignored-globs '((directories (".git" ".svn"))
                            (files ("*.jpg" "*.png" "*.zip" "*~"))))

(global-set-key (kbd "H-p") 'fiplr-find-file)

;; provide
(provide 'init-fiplr)
;;; init-fiplr.el ends here
