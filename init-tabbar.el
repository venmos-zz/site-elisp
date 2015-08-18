;; venmos .emacs.d/elisp/init-tabbar.el
;; http://venmos.com
;; venmos@fuck.gfw.es


;; require
(require 'uniquify)
(require 'tabbar)
(require 'ibuf-ext)
(require 'tabbar)

;; tabbar-extension

(defun tabbar-select-end-tab ()
  "Select end tab of current tabset."
  (interactive)
  (tabbar-select-beg-tab t))

(defun tabbar-select-beg-tab (&optional backward type)
  "Select beginning tab of current tabs.
If BACKWARD is non-nil, move backward, otherwise move forward.
TYPE is default option."
  (interactive)
  (let* ((tabset (tabbar-current-tabset t))
         (ttabset (tabbar-get-tabsets-tabset))
         (cycle (if (and (eq tabbar-cycle-scope 'groups)
                         (not (cdr (tabbar-tabs ttabset))))
                    'tabs
                  tabbar-cycle-scope))
         selected tab)
    (when tabset
      (setq selected (tabbar-selected-tab tabset))
      (setq tabset (tabbar-tabs tabset)
            tab (car (if backward (last tabset) tabset)))
      (tabbar-click-on-tab tab type))))

(defun tabbar-backward-tab-other-window (&optional reversed)
  "Move to left tab in other window.
Optional argument REVERSED default is move backward, if reversed is non-nil move forward."
  (interactive)
  (other-window 1)
  (if reversed
      (tabbar-forward-tab)
    (tabbar-backward-tab))
  (other-window -1))

(defun tabbar-forward-tab-other-window ()
  "Move to right tab in other window."
  (interactive)
  (tabbar-backward-tab-other-window t))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq uniquify-buffer-name-style 'forward)
(tabbar-mode t)
;; shortcuts
(global-set-key (kbd "H-{") 'tabbar-backward)
(global-set-key (kbd "H-}") 'tabbar-forward)
(global-set-key (kbd "C-c [") 'tabbar-backward-group)
(global-set-key (kbd "C-c ]") 'tabbar-forward-group)
;; hide-header-button
(defcustom tabbar-hide-header-button t
  "Hide header button at left-up corner.
Default is t."
  :type 'boolean
  :set (lambda (symbol value)
         (set symbol value)
         (if value
             (setq
              tabbar-scroll-left-help-function nil ;don't show help information
              tabbar-scroll-right-help-function nil
              tabbar-help-on-tab-function nil
              tabbar-home-help-function nil
              tabbar-buffer-home-button (quote (("") "")) ;don't show tabbar button
              tabbar-scroll-left-button (quote (("") ""))
              tabbar-scroll-right-button (quote (("") "")))))
  :group 'tabbar)
;; tabbar-theme-configure
(set-face-attribute 'tabbar-default nil
         :background "#1D1F21"
         :family "Menlo"
         :foreground "#1D1F21"
         :height 1)
(set-face-attribute 'tabbar-unselected nil
         :inherit 'tabbar-default
         :background "#1D1F21"
         :foreground "#89BEB7"
         :box nil)
(set-face-attribute 'tabbar-selected nil
         :inherit 'tabbar-default
         :background "#EEAD0D"
         :foreground "#1D1F21"
         :box nil)
(set-face-attribute 'tabbar-separator nil
         :height 1)
;; buffer-group
(defun venmos-tabbar-buffer-groups () 
  (list (cond ((string-equal "+" (substring (buffer-name) 0 1)) "Message")
              ((eq major-mode 'twittering-mode) "Message")
              ((eq major-mode 'mew-message-mode) "Message")
              ((eq major-mode 'mew-summary-mode) "Messenge")
              ((eq major-mode 'erc-mode) "Message")
              ((eq major-mode 'erc-modes) "Message")
              ((eq major-mode 'weibo-timeline-mode) "Message")
              ((eq major-mode 'weibo-post-mode) "Message")
              ((eq major-mode 'weibo-user-mode) "Message")
              ((eq major-mode 'weibo-image-mode) "Message")
              ((eq major-mode 'dired-mode) "Dired")
              ((eq major-mode 'sr-mode) "Dired")
              ((eq major-mode 'eshell-mode) "Shell")
              ((eq major-mode 'shell-mode) "Shell")
							((eq major-mode 'term-mode) "Shell")
              ((eq major-mode 'org-mode) "Documents")
              ((eq major-mode 'markdown-mode) "Documents")
              ((eq major-mode 'html-mode) "Website")
              ((eq major-mode 'web-mode) "Website")
              ((eq major-mode 'css-mode) "Website")
              ((eq major-mode 'php-mode) "Website")
              ((eq major-mode 'emacs-lisp-mode) "ELisp")
              ((eq major-mode 'calendar-mode) "Emacs")
              ((eq major-mode 'diary-mode) "Emacs")
              ((eq major-mode 'w3m-mode) "W3M")
							((eq major-mode 'eww-mode) "W3M")
							((eq major-mode 'text-mode) "Simplenote")
							((eq major-mode 'magit-mode) "Magit")
							((eq major-mode 'magit-log-mode) "Magit")
							((eq major-mode 'git-commit-mode) "Magit")
						  ;((string-equal "*" (substring (buffer-name) 0 1)) "Emacs")
							(t "User"))))
(setq tabbar-buffer-groups-function 'venmos-tabbar-buffer-groups)
;; provide
(provide 'init-tabbar)
;;; init-tabbar.el ends here
