;; for SpacEmacs https://github.com/syl20bnr/spacemacs
;; venmos .site-elisp/init-gnupg.el
;; http://venmos.com
;; venmos@fuck.gfw.es

(epa-file-enable)
(setq epa-file-encrypt-to nil)
(setq epa-file-cache-passphrase-for-symmetric-encryption t)
(setq epa-file-inhibit-auto-save nil)
(setq pgg-default-scheme "gpg")
(setq pgp-version 'gpg)
(setq pgg-cache-passphrase nil)
(setq pgg-gpg-user-id "4A2C5A73")

;; provide
(provide 'init-gnupg)
;;; init-gnupg.el end here
