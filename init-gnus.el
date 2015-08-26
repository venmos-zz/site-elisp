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

;; store email in ~/gmail directory
(setq nnml-directory "~/.gmail")
(setq message-directory "~/.gmail")
(setq gnus-default-directory "~/.gnus/")
(setq gnus-home-directory "~/.gnus")
(setq gnus-dribble-directory "~/.gnus/")
(setq gnus-directory "~/.gnus/news/")
(setq gnus-article-save-directory "~/.gnus/news/")
(setq gnus-kill-files-directory "~/.gnus/news/trash/")
(setq gnus-agent-directory "~/.gnus/news/agent/")
(setq gnus-cache-directory "~/.gnus/news/cache/")
(setq gnus-cache-active-file "~/.emacs.d/.gnus/news/cache/active")
(setq nntp-marks-directory "~/.gnus/news/marks")


(require 'gnus)
(require 'mm-url)
(defun elfeed-play-movie ()
  (interactive)
  (let ((link (nnrss-get-rsslinks )))
    (cond ((string-match "^http:\\/\\/www\\.youtube\\.com" link)
           (message (concat "loading from youtube... " link))
           (call-process "mpv" nil nil nil link))
          ((string-match "^http:\\/\\/www\\.bilibili\\.com" link)
					 (message (concat "loading from bilibili..." link))
           (call-process "bili" nil nil nil link)))))

;; provide
(provide 'init-gnus)
;;; init-gnus.el end here
