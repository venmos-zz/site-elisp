;; venmos .emacs.d/elisp/init-chinese-fonts.el
;; http://venmos.com
;; me[at]venmos.com

;(require 'chinese-fonts-setup)
(require 'chinese-word-at-point)
(require 'chinese-pyim)
(thing-at-point 'chinese-or-other-word)
(global-set-key (kbd "M-f") 'pyim-forward-word)
(global-set-key (kbd "M-b") 'pyim-backward-word)
(setq pyim-enable-words-predict nil)
(setq default-input-method "chinese-pyim")
(global-set-key (kbd "H-;") 'toggle-input-method)
(global-set-key (kbd "H-'") 'pyim-toggle-full-width-punctuation)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
	 ["black" "red3" "#9ADEDA" "yellow3" "#FFCF9E" "magenta3" "cyan3" "gray90"])
 '(eww-search-prefix "https://www.google.com.hk/search?q=")
 '(pyim-dicts
	 (quote
		((:name "default" :file "/Users/venmos/.emacs.d/plugin/pyim-bigdict.pyim" :coding utf-8-unix :dict-type pinyin-dict)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; provide
(provide 'init-chinese-fonts)
;;; init-chinese-fonts.el ends here
