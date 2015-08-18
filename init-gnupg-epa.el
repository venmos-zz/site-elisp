;; venmos .emacs.d/elisp/init-gnupg-epa.el
;; http://venmos.com
;; venmos@fuck.gfw.es


(require 'epa-file)
(epa-file-enable)

(setq epa-file-encrypt-to nil)
(setq epa-file-cache-passphrase-for-symmetric-encryption t)
(setq epa-file-inhibit-auto-save nil)

(setq pgg-default-scheme "gpg")
(setq pgp-version 'gpg)
(setq pgg-cache-passphrase nil)

;; default-id
(setq pgg-gpg-user-id "venmos")

;; provide
(provide 'init-gnupg-epa)
;;; inig-gnupg-epa.el ends here
