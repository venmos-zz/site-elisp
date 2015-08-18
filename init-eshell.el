;; venmos .emacs.d/elisp/init-eshell.el
;; http://venmos.com
;; me[at]venmos.com
;; by https://github.com/pengpengxp


;; eshell color
(setq eshell-prompt-function
      '(lambda ()
         (concat
          "@"user-login-name " "
          (if (search (directory-file-name (expand-file-name (getenv "HOME"))) (eshell/pwd))
              (replace-regexp-in-string (expand-file-name (getenv "HOME")) "~" (eshell/pwd))
            (eshell/pwd))
          (if (= (user-uid) 0) " # " " $ "))))

(defun colorfy-eshell-prompt ()
  "Colorfy eshell prompt according to `@user' regexp."
  (let* ((mpoint)
         (user-string-regexp (concat "^" "@"user-login-name )))
    (save-excursion
      (goto-char (point-min))
      (while (re-search-forward (concat user-string-regexp ".*[$#]") (point-max) t)
        (setq mpoint (point))
        (overlay-put (make-overlay (point-at-bol) mpoint) 'face '(:foreground "dodger blue")))
      (goto-char (point-min))
      (while (re-search-forward user-string-regexp (point-max) t)
        (setq mpoint (point))
        (overlay-put (make-overlay (point-at-bol) mpoint) 'face '(:foreground "#2AA19D"))
        ))))

;; Make eshell prompt more colorful
(add-hook 'eshell-output-filter-functions 'colorfy-eshell-prompt)

;; eshell mode
(setq eshell-glob-case-insensitive t)	;glob 不区分大小写
(setq eshell-error-if-no-glob t)	;如果 glob 出现不匹配则认为出错，这和 zsh 是一样的，和 bash 不同
(setq eshell-cmpl-ignore-case t)	;在补全 filename 的时候不区分大小写
(setq eshell-history-size 10000)	;记录很多命令，方便直接调用

;;; 自己写的`advice'。将`buffer-name'修改为当前目录。只是我的个人习惯
(defadvice eshell/cd (after peng-eshell-change-buffer-name activate)
  (rename-buffer (concat "*eshell*:"
		       default-directory) t))

;;; 同时对这几个函数也做一些`advice'。每次进入都会显示当前目录了
(defadvice shell-switcher-switch-buffer (after peng-eshell-change-buffer-name activate)
  (rename-buffer (concat "*eshell*:"
		       default-directory) t))
(defadvice shell-switcher-new-shell (after peng-eshell-change-buffer-name activate)
  (rename-buffer (concat "*eshell*:"
												 default-directory) t))

;;; 这个 find-file 比我自己定义的好很多。可以同时打开多个文件。我最后定
;;; 义了两个 alias
(defun eshell/ff (&rest args)
  "Opens a file in emacs."
  (when (not (null args))
    (mapc #'find-file (mapcar #'expand-file-name (eshell-flatten-list (reverse args))))))

(if (string= system-type "darwin")
;;; 照着`eshell/ff'定义了一个`eshell/o'函数
    (defun eshell/o (&rest args)
      "Opens a file in emacs."
      (when (not (null args))
	(mapc '(lambda (a)
		 (shell-command (concat "open "
					a)))
	      (mapcar #'expand-file-name (eshell-flatten-list (reverse args))))))
  )

(defun eshell/lg (&rest args)
  "因为经常使用`ls|grep xxx'这样的命令，就自己包装了一个"
  (when (not (null args))
    (shell-command-to-string (concat "ls|grep -i "
				     (format "%s" (car args))))))

(defun eshell/idolg (&rest args)
  "调用 ido 来读取`ls|grep xxx'的结果"
  (if (not (null args))
      (progn
	(setq result (ido-completing-read "Which one: "
					  (split-string
					   (shell-command-to-string (concat "ls|grep -i "
									    (format "%s" (car args)))) "\n"))))
    (progn
      (setq result (ido-completing-read "Which one: "
					(split-string
					 (shell-command-to-string "ls|grep -i .") "\n"))))))


(if (string-equal system-type "darwin")
    (progn
      (defun eshell/lf (&rest args)
	"使用 find 来递归地查找当前目录中名为 args 的文件，还可以通过
使用 gnu/find 中的-maxdepth 选项来控制递归的深度，"
	(when (not (null args))
	  (shell-command-to-string (concat "gfind -type f -name '*"
					   (format "%s" (car args))
					   "*'"))))
      (defun eshell/idoff (&rest args)
	"调用 ido 来读取 eshell/lf 的结果"
	(if (not (null args))
	    (progn
	      (setq result (ido-completing-read "Which one: "
						(split-string
						 (shell-command-to-string (concat "gfind -type f -name '*"
										  (format "%s" (car args))
										  "*' &")) "\n"))))
	  (progn
	    (setq result (ido-completing-read "Which one: "
					      (split-string
					       (shell-command-to-string (concat "gfind -type f -name '*' &")) "\n"))))))
      )

  )

(if (string-equal system-type "gnu/linux")
    (progn
      (defun eshell/lf (&rest args)
	"使用 find 来递归地查找当前目录中名为 args 的文件，还可以通过
使用 gnu/find 中的-maxdepth 选项来控制递归的深度，"
	(when (not (null args))
	  (shell-command-to-string (concat "find -type f -name '*"
					   (format "%s" (car args))
					   "*'"))))
      (defun eshell/idoff (&rest args)
	"调用 ido 来读取 eshell/lf 的结果"
	(if (not (null args))
	    (progn
	      (setq result (ido-completing-read "Which one: "
						(split-string
						 (shell-command-to-string (concat "find -type f -name '*"
										  (format "%s" (car args))
										  "*' &")) "\n"))))
	  (progn
	    (setq result (ido-completing-read "Which one: "
					      (split-string
					       (shell-command-to-string (concat "find -type f -name '*' &")) "\n"))))))))


;;; 根据我的个人爱好设置一下 company-mode 在 eshell 中的补全，这个在有了
;;; `eshell-ido-pcomplete'后就可能用得少了
(defun peng-eshell-company-files ()
  (interactive)
  (company-begin-backend 'company-files)
  )

(defun peng-ido-eshell-history ()
  "use ido-style to read  eshell-history"
  (interactive)
  (let* ((index 0)
	 (peng-ido-eshell-list nil)
	 (end (point))
	 (beg (save-excursion (eshell-bol) (point)))
	 (input (buffer-substring beg end)))
    (while (<= index eshell-history-size)
      (add-to-list 'peng-ido-eshell-list (eshell-get-history index))
      (setq index (1+ index)))
    (setq peng-ido-eshell-list (delete-dups (reverse peng-ido-eshell-list)))
    (if (equal input "")
	(insert (ido-completing-read "Eshell-history: " peng-ido-eshell-list))
      (goto-char beg)
      (kill-line)
      (insert (ido-completing-read "Eshell-history: " peng-ido-eshell-list
    				 nil
    				 nil
    				 input)))))
(defun peng-eshell-mode-hook ()
  (linum-mode -1)
  
  (define-key global-map (kbd "C-c h") 'peng-ido-eshell-history)
  (setq eshell-last-dir-ring-size 200)	;记录 200 个目录
  (company-mode -1)			;因为有 ido 来补全，可以默认关闭
					;company-mode
  )
(add-hook 'eshell-mode-hook 'peng-eshell-mode-hook)

;;; ielm-mode hook
(defun peng-ielm-mode-hook ()
  (company-mode -1))
(add-hook 'ielm-mode-hook 'peng-eshell-mode-hook)

(if (string= system-type "darwin")
    (defun eshell/pengpwd ()
      "copy current dirctory to clipboard, only usefull on mac"
      (shell-command-to-string "pwd|pbcopy")))


(defun eshell/clear ()
  "Clears the shell buffer ala Unix's clear or DOS' cls"
  ;; the shell prompts are read-only, so clear that for the duration
  (let ((inhibit-read-only t))
    ;; simply delete the region
    (delete-region (point-min) (point-max))))

;;; 这个配合`ido'使用很方便
(defun peng-async-shell-command (COM)
  "Run the shell command asynchronize Don't ask me whether to
create a new buffer just because the default buffer is used.

For this reason, I create a random output buffer rather than the
default one every time I launch a shell command.

The COM is what you want to excute. It MUST be a string."
  (save-window-excursion
    (save-excursion
      (let ((RANDOM-NUM (message "%s" (random 10000))))
      (async-shell-command COM
			   (get-buffer-create 
			    (concat "peng-async-shell-command-output-" RANDOM-NUM)))  
	))))

(defun eshell/j ()
  "Quickly jump to previous directories."
  (eshell/cd (ido-completing-read "Jump to directory: "
                                  (delete-dups (ring-elements eshell-last-dir-ring)))))

(if (string= system-type "darwin")
    (defun eshell/jo ()
      "Quickly jump to previous directories."
      (let ((result (helm-comp-read "Open the directory: "
				    (delete-dups (ring-elements eshell-last-dir-ring)))))
	(peng-async-shell-command (concat "open " result)))))

;; provide
(provide 'init-eshell)
;;; init-eshell.el ends here
