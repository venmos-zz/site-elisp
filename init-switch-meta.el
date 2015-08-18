;; venmos .emacs.d/elisp/init-switch-meta.el
;; http://venmos.com
;; venmos@fuck.gfw.es


;; Keybonds
(global-set-key [(hyper a)] 'mark-whole-buffer)
(global-set-key [(hyper v)] 'yank)
(global-set-key [(hyper c)] 'kill-ring-save)
;(global-set-key [(hyper s)] 'save-buffer)
(global-set-key [(hyper l)] 'goto-line)
(global-set-key [(hyper w)]
                (lambda () (interactive) (delete-window)))
;(global-set-key [(hyper z)] 'undo)

;; mac switch meta key
(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'hyper)

;; provide
(provide 'init-switch-meta)
;;; init-switch-meta.el.el ends here
