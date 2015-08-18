;; venmos .emacs.d/elisp/init-osx-browse.el
;; http://venmos.com
;; venmos@fuck.gfw.es

(require 'osx-browse)

(osx-browse-mode 1)

(define-key osx-browse-mode-map (kbd "H-b") 'osx-browse-url)
(define-key osx-browse-mode-map (kbd "H-i") 'osx-browse-search)

;; provide
(provide 'init-osx-browse)
;;; init-osx-browse.el ends here
