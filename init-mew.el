;; venmos .emacs.d/elisp/init-mew.el
;; http://venmos.com
;; me[at]venmos.com

(autoload 'mew "mew" nil t)
(autoload 'mew-send "mew" nil t)
(setq mew-fcc "+outbox")

;(add-to-list 'load-path "~/.emacs.d/plugin/mew-6.6/")

;(require 'mew)
; 
;;; configuration
;;(autoload 'mew "mew" nil t)
;;(autoload 'mew-send "mew" nil t)
; 
;(condition-case nil
;    (require 'mew-w3m)
;  (file-error nil))
; 
;(setq read-mail-command 'mew)
; 
;(autoload 'mew-user-agent-compose "mew" nil t)
;(if (boundp 'mail-user-agent)
;    (setq mail-user-agent 'mew-user-agent))
;(if (fboundp 'define-mail-user-agent)
;    (define-mail-user-agent
;      'mew-user-agent
;      'mew-user-agent-compose
;      'mew-draft-send-message
;      'mew-draft-kill
;      'mew-send-hook))

;(setq mew-prog-ssl "/usr/local/bin/stunnel")

;; provide
(provide 'init-mew)
;;; init-mew.el ends here
