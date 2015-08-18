;; venmos .emacs.d/elisp/init-erc.el
;; http://venmos.com
;; venmos@fuck.gfw.es

;; require
(require 'erc)
(require 'tls)
(require 'erc-nicklist)
(require 'erc-image)
(require 'erc-crypt)

(add-to-list 'erc-modules 'image)
(erc-update-modules)

(setq erc-auto-discard-away t)
(setq erc-button-buttonize-nicks nil)
(setq erc-track-exclude-server-buffer t)
(setq erc-track-exclude-types '("NICK" "333" "353" "JOIN" "PART" "QUIT"))

(setq erc-log-channels-directory "~/.emacs.d/logs/")
(setq erc-save-buffer-on-part nil)
(setq erc-save-queries-on-quit nil
      erc-log-write-after-send t
      erc-log-write-after-insert t)

(setq erc-keywords '((".*Online.*" (:foreground "green"))
		     (".*Busy" (:foreground "red"))
		     (".*Away" (:foreground "red"))
		     (".*Idle" (:foreground "orange"))
		     ))

(setq erc-prompt (lambda ()
                   (if (and (boundp 'erc-default-recipients)
                            (erc-default-target))
                       (erc-propertize (concat (erc-default-target) ">")
                                       'read-only t
                                       'rear-nonsticky t
                                       'front-nonsticky t)
                     (erc-propertize (concat "ERC>")
                                     'read-only t
                                     'rear-nonsticky t
                                     'front-nonsticky t))))


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
;;; init-erc.el ends here
