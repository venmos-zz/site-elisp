;; venmos .emacs.d/elisp/init-w3m.el
;; http://venmos.com
;; venmos@fuck.gfw.es

(require 'w3m)
;(require 'w3m-load)
(require 'w3m-search)

(setq w3m-coding-system 'utf-8
        w3m-file-coding-system 'utf-8
        w3m-file-name-coding-system 'utf-8
        w3m-input-coding-system 'utf-8
        w3m-output-coding-system 'utf-8
        w3m-terminal-coding-system 'utf-8)

;; 设置 w3m 主页
(setq w3m-home-page "https://www.google.com.hk")
;; 默认显示图片
(setq w3m-default-display-inline-images t)
(setq w3m-default-toggle-inline-images t)
;; 使用 cookies
(setq w3m-use-cookies t)
;; 设定 w3m 运行的参数，分别为使用 cookie 和使用框架
(setq w3m-command-arguments '("-cookie" "-F"))
;; 使用 w3m 作为默认浏览器
(setq browse-url-browser-function 'w3m-browse-url)
(setq w3m-view-this-url-new-session-in-background t)
(setq w3m-new-session-in-background t)
;;显示图标
(setq w3m-show-graphic-icons-in-header-line t)
(setq w3m-show-graphic-icons-in-mode-line t)

(setq w3m-search-default-engine "g")

(eval-after-load "w3m-search" '(progn

                                 (add-to-list 'w3m-search-engine-alist '("bb"
"http://www.bilibili.com/search?keyword=%s" utf-8))
                                 (add-to-list 'w3m-search-engine-alist '("g"
"http://www.google.com.hk/search?q=%s" utf-8))))
								
(defadvice w3m-search (after change-default activate)
      (let ((engine (nth 1 minibuffer-history)))
  (when (assoc engine w3m-search-engine-alist)
    (setq w3m-search-default-engine engine))))

;; mpv
(defun w3m-play-movie ()
  (interactive)
  (let ((url (w3m-anchor)))
    (cond ((string-match "^http:\\/\\/www\\.youtube\\.com" url)
           (message (concat "loading from youtube... " url))
           (call-process "mpv" nil nil nil url))
          ((string-match "^http:\\/\\/www\\.bilibili\\.com" url)
					 (message (concat "loading from bilibili..." url))
           (call-process "bili" nil nil nil url)))))

(with-eval-after-load 'w3m
											 (define-key w3m-mode-map (kbd "j") 'cua-scroll-up)
											 (define-key w3m-mode-map (kbd "k") 'cua-scroll-down)
											 (define-key w3m-mode-map (kbd "C-c p") 'w3m-play-movie)
											 )
;; provide
(provide 'init-w3m)
;;; init-w3m.el ends here
