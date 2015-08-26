;; for SpacEmacs https://github.com/syl20bnr/spacemacs
;; venmos .site-elisp/init-elfeed.el
;; http://venmos.com
;; venmos@fuck.gfw.es

(require 'elfeed)

;; rss
(setq elfeed-feeds
      '(("http://www.bilibili.com/rss-13.xml" BiliBili)
				("http://www.bilibili.com/rss-1.xml" BiliBili)
				("http://www.bilibili.com/rss-3.xml" BiliBili)
				))

(define-key elfeed-search-mode-map (kbd "j") 'next-line)
(define-key elfeed-search-mode-map (kbd "k") 'previous-line)
(define-key elfeed-show-mode-map (kbd "j") 'cua-scroll-up)
(define-key elfeed-show-mode-map (kbd "k") 'cua-scroll-down)
(define-key elfeed-show-mode-map (kbd "n") 'elfeed-show-next)
(define-key elfeed-show-mode-map (kbd "p") 'elfeed-show-prev)
(define-key elfeed-show-mode-map (kbd "s") 'elfeed-show-new-live-search)
(define-key elfeed-show-mode-map (kbd "b") 'elfeed-show-visit)
(define-key elfeed-show-mode-map (kbd "y") 'elfeed-show-yank)
(define-key elfeed-show-mode-map (kbd "m") 'elfeed-play-movie)
(define-key elfeed-show-mode-map (kbd "u") (elfeed-expose #'elfeed-show-tag 'unread))
(define-key elfeed-show-mode-map (kbd "+") 'elfeed-show-tag)
(define-key elfeed-show-mode-map (kbd "-") 'elfeed-show-untag)

(defun elfeed-play-movie ()
  (interactive)
  (let ((link (elfeed-entry-link elfeed-show-entry)))
		  (cond ((string-match "^http:\\/\\/www\\.youtube\\.com" link)
           (message (concat "loading from youtube... " link))
           (call-process "mpv" nil nil nil link))
          ((string-match "^http:\\/\\/www\\.bilibili\\.com" link)
					 (message (concat "loading from bilibili..." link))
           (call-process "bili" nil nil nil link)))))

;; provide
(provide 'init-elfeed)
;;; init-elfeed.el ends here
