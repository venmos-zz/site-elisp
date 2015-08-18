;; venmos .emacs.d/elisp/init-org-mode.el
;; http://venmos.com
;; venmos@fuck.gfw.es

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(setq org-log-done t)
(setq org-startup-indented t
      org-agenda-include-diary nil
      org-agenda-start-on-weekday nil
      org-agenda-include-all-todo t
      org-agenda-include-all-deadline t)

;; capture-key
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cr" 'org-capture)

;; file-path
(setq diary-file "~/.emacs.d/Org-Mode/Diary/diary")
(setq org-directory "~/.emacs.d/Org-Mode/")
(setq org-agenda-files (list "~/.emacs.d/Org-Mode/todo.org"))
(setq org-default-notes-file "~/.emacs.d/Org-Mode/note.org")

;; capture-templates
(setq org-clock-persistence-insinuate t)
(setq org-clock-persist t)
(setq org-clock-in-resume t)
(setq org-capture-templates
      `(("i" "Inbox" entry (file+headline ,"~/.emacs.d/Org-Mode/todo.org" "Inbox")
         "* TODO %?\n%U\n%a\n")
        ("e" "Emacs" entry (file+headline ,"~/.emacs.d/Org-Mode/todo.org" "Emacs")
         "* TODO %?\n%U\n%a\n")
				("w" "Wiki" entry (file+headline ,"~/.emacs.d/Org-Mode/todo.org" "Wiki")
         "* TODO %?\n%U\n%a\n")
        ("s" "Study" entry (file+headline ,"~/.emacs.d/Org-Mode/todo.org" "Study")
         "* TODO %?\n%U\n%a\n")
				("S" "ShiTong" entry (file+headline ,"~/.emacs.d/Org-Mode/todo.org" "ShiTong")
         "* TODO %?\n%U\n%a\n")
        ("n" "Note" entry (file+headline ,"~/.emacs.d/Org-Mode/note.org" "Note")
         "* Note %?\n%U\n")))

;; search hello-emacs
(setq hello-emacs-dir (expand-file-name "~/.emacs.d/study/"))

(defun open-hello-emacs ()
	(interactive)
	(ido-find-file-in-dir hello-emacs-dir))

(defun search-hello-emacs ()
	(interactive)
	(helm-ag hello-emacs-dir))

;; gpg

(require 'org-crypt)
(org-crypt-use-before-save-magic)
(setq org-crypt-tag-matcher "secret")
(setq org-tags-exclude-from-inheritance (quote ("secret")))
(setq org-crypt-key "4A2C5A73")
(global-set-key "\C-cc" 'org-decrypt-entry)

;; diart
(setq view-diary-entries-initially t
      mark-diary-entries-in-calendar t
      number-of-diary-entries 7)
(add-hook 'diary-display-hook 'fancy-diary-display)
(add-hook 'today-visible-calendar-hook 'calendar-mark-today)
(add-hook 'fancy-diary-display-mode-hook
          '(lambda ()
             (alt-clean-equal-signs)))

(defun alt-clean-equal-signs ()
  "This function makes lines of = signs invisible."
  (goto-char (point-min))
  (let ((state buffer-read-only))
    (when state (setq buffer-read-only nil))
    (while (not (eobp))
      (search-forward-regexp "^=+$" nil 'move)
      (add-text-properties (match-beginning 0) 
                           (match-end 0) 
                           '(invisible t)))
    (when state (setq buffer-read-only t))))

(define-derived-mode fancy-diary-display-mode fundamental-mode
  "Diary"
  "Major mode used while displaying diary entries using Fancy Display."
  (set (make-local-variable 'font-lock-defaults)
       '(fancy-diary-font-lock-keywords t))
  (define-key (current-local-map) "q" 'quit-window)
  (define-key (current-local-map) "h" 'calendar))

(defadvice fancy-diary-display (after set-mode activate)
  "Set the mode of the buffer *Fancy Diary Entries* to
`fancy-diary-display-mode'."
  (save-excursion
    (set-buffer fancy-diary-buffer)
    (fancy-diary-display-mode)))

;; key
(defun fortibber-org-mode-key ()
  (define-key org-mode-map (kbd "C-x SPC") nil)
  (define-key org-mode-map (kbd "C-c SPC") nil)
  (define-key org-mode-map (kbd "s-{") nil)
  (define-key org-mode-map (kbd "s-}") nil)
  (define-key org-mode-map (kbd "C-c [") nil)
  (define-key org-mode-map (kbd "C-c ]") nil))

(add-hook 'org-mode-hook 'fortibber-org-mode-key)

(setq org-completion-use-ido t)

;; provide
(provide 'init-org-mode)
;;; init-org-mode.el ends here
