;; venmos .emacs.d/elisp/
;; http://venmos.comw
;; venmos@fuck.gfw.es

;; The author : https://github.com/browse-kill-ring/browse-kill-ring

(require 'browse-kill-ring)

(defvar kill-ring-ido-shortage-length 10)

(defface kill-ring-ido-number-face
  '((((class color) (background dark))
      :foreground "black"
      :background "gray80")
     (((class color) (background light))
       :foreground "gray80"
       :background "black"))
  "Font for shorten number between beginning and end of text")

(defadvice ido-set-matches-1(around this-is-needed-to-search-through-long-strings)
  "I need to search through long string(with is in cadr, not in car), but outside ido-set-matches, ido-name should be default."
  (flet ((ido-name (item) (if (consp item) (cadr item) item)))
    ad-do-it))

(defun kill-ring-ido(&optional arg prompt ring insert)
  "With RING is nil:
With ARG, use `secondary-selection-ring', else, use `kill-ring'.
Default prompt is set to \"kill-ring\" and \"secondary-kill-ring\" accordingly.
If RING is not nil:
Use RING instead. Default prompt is \"ring\"."
  (interactive "P")
  (if (and (not ring) (member last-command '(yank yank-secondary yank-pop yank-pop-commands)))
    (if (fboundp 'yank-pop-commands)
      (yank-pop-commands) ; second-sel.el
      (yank-pop))
    ;; else
    (if ring
      (unless prompt (setq prompt "ring: "))
      ;; else
      (setq ring (if arg secondary-selection-ring kill-ring))
      (unless prompt (setq prompt (if arg "secondary-selection-ring: " "kill-ring: "))))
    (let ((choices
            (mapcar
              (lambda(arg)
                (list
                  (if (> (length (replace-regexp-in-string "\n" "" (replace-regexp-in-string "^[   ]+" "" arg))) (+ (* 2 kill-ring-ido-shortage-length) 1))
                    (concat
                      (substring (replace-regexp-in-string "\n" "" (replace-regexp-in-string "^[   ]+" "" arg)) 0 kill-ring-ido-shortage-length)
                      (propertize (format "#%d#" (- (length arg) (* 2 kill-ring-ido-shortage-length))) 'face 'kill-ring-ido-number-face)
                      (substring (replace-regexp-in-string "\n" "" (replace-regexp-in-string "^[   ]+" "" arg)) (- kill-ring-ido-shortage-length)))
                    (replace-regexp-in-string "\n" "" (replace-regexp-in-string "^[   ]+" "" arg)))
                  arg))
              ring)))
      (ad-activate 'ido-set-matches-1)
      (prog1
        (let ((answer (progn
                        (ido-completing-read (format (concat "(%d)" prompt) (length ring)) choices)
                        (cadar ido-matches))))
          (insert answer))
        (ad-deactivate 'ido-set-matches-1))
      )))

(global-set-key (kbd "C-y") 'kill-ring-ido)
(browse-kill-ring-default-keybindings)

;; provide
(provide 'init-kill-ring-ido)
;;; init-kill-ring-ido.el ends here
