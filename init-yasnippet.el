;; venmos .emacs.d/elisp/init-yasnippet.el
;; http://venmos.com
;; venmos@fuck.gfw.es

(yas-global-mode t)

(yas/load-directory "~/.emacs.d/plugin/yasnippets")
(setq yas-snippets-dir (expand-file-name "~/.emacs.d/plugin/yasnippets"))

(defun o-yass ()
  (interactive)
  (ido-find-file-in-dir yas-snippets-dir))

(defun l-yass ()
  (interactive)
  (yas-load-directory yas-snippets-dir))

(defun d-yass ()
  (interactive)
  (find-file yas-snippets-dir))

(defun s-yass ()
  (interactive)
  (helm-ag yas-snippets-dir))

;; provide
(provide 'init-yasnippet)
;;; init-yasnippet.el ends here
