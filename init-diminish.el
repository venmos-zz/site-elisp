(require 'diminish)

(when (require 'diminish nil 'noerror)
  (eval-after-load "company"
		'(diminish 'company-mode "Ⓒ"))
	(eval-after-load "P"
		'(diminish 'pangu-spacing-mode "Ⓟ"))
	(eval-after-load "P"
	'(diminish 'global-pangu-spacing-mode "Ⓟ"))
  (eval-after-load "yasnippet"
    '(diminish 'yas-minor-mode "Ⓨ")))

(provide 'init-diminish)
