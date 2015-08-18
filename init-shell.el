;; venmos .emacs.d/elisp/
;; http://venmos.com
;; venmos@fuck.gfw.es

(require 'shell-command)
(require 'shell-command-extension)
(require 'multi-term)
(require 'ansi-color)

(ansi-color-for-comint-mode-on)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; shell-ansi-color
(custom-set-variables
 '(ansi-color-names-vector
   ["black" "red3" "#9ADEDA" "yellow3" "#FFCF9E" "magenta3" "cyan3" "gray90"]))
(custom-set-faces)


;; default-shell
(setq shell-file-name "/usr/local/bin/zsh")
(setq system-uses-terminfo nil)

;; local zsh
(defun zsh ()
  (interactive)
  (multi-term)
  (rename-buffer "Local-Shell"))

;; config
(setq comint-prompt-read-only t)
(setq shell-command-completion-mode t)

;;multi-term
(add-hook 'term-mode-hook
          (lambda ()
            (setq term-buffer-maximum-size 10000)))

(add-hook 'term-mode-hook
          (lambda ()
            (setq show-trailing-whitespace nil)))


(add-hook 'term-mode-hook (lambda()
														(yas-minor-mode -1)))

(defadvice term-send-input (after update-pwd)                                                        
	(let* ((pid (process-id (get-buffer-process (current-buffer))))                                      
				 (pwd (shell-command-to-string                                                                   
							 (format "lsof -p %d -Fn | awk 'NR==2{print}' | sed \"s/n\\//\\//\" |  tr -d '\n'" pid)))) 
		(cd pwd)                                                                                             
		(message (concat "change emacs path to: " pwd))))                                                    
(ad-activate 'term-send-input)                                                                       
;; provide
(provide 'init-shell)
;;; init-shell.el ends here
