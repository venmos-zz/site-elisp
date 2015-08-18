;; venmos .emacs.d/elisp/init-emacs.el
;; http://venmos.com
;; venmos@fuck.gfw.es

;; fonts
(set-default-font "Source Code Pro Light 12")
;; bookmark
(setq bookmark-save-flag 1)
(setq bookmark-default-file "~/.emacs.d/bookmark.bmk")
(global-set-key [f6] 'list-bookmarks)
;; find-grep-dired
(global-set-key (kbd "C-x s") 'find-grep-dired)
;; fullscreen
(global-set-key (kbd "C-x w f") 'toggle-frame-fullscreen)
;; os x command+v paste
(global-set-key (kbd "A-v") 'cua-paste)
;; disable bell
(setq visible-bell 1)
;; cursor color
(set-cursor-color "#EEAD0D")
;; auto save
(setq auto-save-mode 1)
;; enable cua-mode
(cua-mode 1)
(setq cua-enable-cua-keys -1)
;; Times
(display-time-mode 1)
(setq display-time-24hr-format 1)
;; auto load file
(global-auto-revert-mode 1)
;; width
(setq-default tab-width 2)
(setq-default indent-tabs-mode -1)
;; disable start message
(setq inhibit-startup-message t)
;; yes-no
(fset 'yes-or-no-p 'y-or-n-p)
;; Ctrl-d del
(delete-selection-mode t)
;; disable bar
(scroll-bar-mode -1)
;; disable tools bar
(tool-bar-mode -1)
;; blink cursor
(blink-cursor-mode 1)
;; 
(show-paren-mode 1)
;; show line number
(column-number-mode t)
(line-number-mode t)
;; line bar
(setq linum-format "%4d")
(global-set-key (kbd "C-c C-c l") 'global-linum-mode)
;; 
(setq x-select-enable-clipboard t)  
;; smart C-a
(defun smart-beginning-of-line ()
  (interactive "^")
  (let ((oldpos (point)))
          (back-to-indentation)
          (and (= oldpos (point))
               (beginning-of-line))))
(global-set-key [home] 'smart-beginning-of-line)
(global-set-key (kbd "C-a") 'smart-beginning-of-line)
;; windows
(define-key global-map (kbd "s-_") 'shrink-window)
(define-key global-map (kbd "s-+") 'balance-windows)
(global-set-key (kbd "C-x o") 'switch-window)
(auto-image-file-mode t)
;; 
(when (fboundp 'winner-mode) 
  (winner-mode) 
  (windmove-default-keybindings))
;; Move to trash when deleting stuff
(setq delete-by-moving-to-trash t
      trash-directory "~/.Trash/emacs")
;; autocomplete paired brackets
(electric-pair-mode 1)

;;;;;;

(setq emacs-d-dir (expand-file-name "~/.emacs.d/my-elisp"))

(defun o-ed ()
  (interactive)
  (ido-find-file-in-dir emacs-d-dir))

(defun s-ed ()
	(interactive)
	(helm-ag emacs-d-dir))

(setq github-dir (expand-file-name "~/Github"))

(defun o-hub ()
  (interactive)
  (ido-find-file-in-dir github-dir))

(defun s-hub ()
  (interactive)
  (helm-ag github-dir))

;; provide
(provide 'init-emacs)
;;; init-emacs.el ends here
