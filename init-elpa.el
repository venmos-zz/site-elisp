;; venmos .emacs.d/elisp/ini-elpa.el
;; http://venmos.com
;; venmos@fuck.gfw.es

(require 'package)

;; melpa
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(when (< emacs-major-version 24)
	(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

;; provide
(provide 'init-elpa)
;;; init-elpa.el ends here
