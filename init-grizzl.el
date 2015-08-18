;; venmos .emacs.d/elisp/
;; http://blog.venmos.com
;; me[at]venmos.com

;; define a search index
(defvar *search-index* (grizzl-make-index '("one" "two" "three" "four")))

;; prompt the use to pick from the index
(grizzl-completing-read "Number: " *search-index*)

(provide 'init-grizzl)
;;; init-grizzl.el ends here
