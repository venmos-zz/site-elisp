;; venmos .emacs.d/elisp/init-ibuffer.el
;; http://venmos.com
;; venmos@fuck.gfw.es

(require 'ibuffer)
(require 'ibuf-ext)

;; ibuffer group
(setq ibuffer-saved-filter-groups
          (quote (("venmos" 
                   ("Emacs" (or
                             (name . "^\\*scratch\\*$")
                             (name . "^\\*Messages\\*$")
                             (name . "^\\*Compile-Log\\*$")
                             (name . "^\\*tramp")
                             (mode . calendar-mode)
                             (mode . diary-mode)))
                   ("ELisp" (or
                             (mode . emacs-lisp-mode)))
                  ("Dired" (or
                            (mode . sr-mode)
                            (mode . dired-mode)))
                   ("Messenge" (or
                                (name . "^\\+" )
                                (mode . twittering-mode)
                                (mode . mew-summary-mode)
                                (mode . mew-message-mode)
                                (mode . erc-mode)
                                (mode . erc-modes)
                                (mode . weibo-timeline-mode)
                                (mode . weibo-post-mode)
                                (mode . weibo-user-mode)))
                   ("Shell" (or
                             (mode . eshell-mode)
                             (mode . shell-mode)))
                   ("Documents" (or
                                 (mode . org-mode)
                                 (mode . markdown-mode)))
                   ("W3M" (or
                           (mode . w3m-mode)))
                   ("Website" (or
                               (mode . html-mode)
                               (mode . php-mode)
                               (mode . web-mode)
                               (mode . multi-web-mode)
                               (mode . css-mode)))))))
(add-hook 'ibuffer-mode-hook
             (lambda ()
               (ibuffer-switch-to-saved-filter-groups "venmos")))

;; shortcuts
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; provide
(provide 'init-ibuffer)
;;; init-ibuffer.el ends here
