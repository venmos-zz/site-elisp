;; for SpacEmacs https://github.com/syl20bnr/spacemacs
;; venmos .site-elisp/init-gnus.el
;; http://venmos.com
;; venmos@fuck.gfw.es

;; gnus
;; Get email, and store in nnml
(setq gnus-secondary-select-methods
      '(
        (nnimap "gmail"
                (nnimap-address
                 "imap.gmail.com")
                (nnimap-server-port 993)
                (nnimap-stream ssl))
        ))
;; Send email via Gmail:
(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-default-smtp-server "smtp.gmail.com")

;; Archive outgoing email in Sent folder on imap.gmail.com:
(setq gnus-message-archive-method '(nnimap "imap.gmail.com")
      gnus-message-archive-group "[Gmail]/Sent Mail")

;; set return email address based on incoming email address
(setq gnus-posting-styles
      '(((header "to" "venmos@fuck.gfw.es")
         (address "venmos@fuck.gfw.es"))))


;; provide
(provide 'init-gnus)
;;; init-gnus.el end here
