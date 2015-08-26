;; for SpacEmacs https://github.com/syl20bnr/spacemacs
;; venmos .site-elisp/init-erc.el
;; http://venmos.com
;; venmos@fuck.gfw.es


  ;;; erc
(defun erc-freenode ()
  "Log into freenode with less keystrokes"
  (interactive)
  (let
      ((password-cache nil))
    (erc-tls
     :server "banks.freenode.net"
     :port "6697"
     :nick "venmos"                ;set your username here
     :password (password-read (format "Hello venmos. welcome back to Freenode. Please enter your Password. ")))))

(defun erc-gtalk ()
  (interactive)
  (erc-ssl
   :server "testing.bitlbee.org"
   :port "6668"
   :nick "venmos"
   :password (password-read (format "Hello venmos. welcome back to Gtalk. Please enter your Password. "))))

;; provide
(provide 'init-erc)
;;; init-erc.el end here
