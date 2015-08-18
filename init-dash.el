;; venmos .emacs.d/elisp/init-dash.el
;; http://venmos.com
;; venmos@fuck.gfw.es

(autoload 'dash-at-point "dash-at-point"
  "Search the word at point with Dash." t nil)

(global-set-key "\C-cd" 'dash-at-point)

;; provide
(provide 'init-dash)
;;; init-dasn.el ends here
