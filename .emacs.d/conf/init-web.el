;; ;; twittering-modeを使う
(require 'twittering-mode)
(setq twittering-use-master-password t)

; (require 'w3m-load)

;; (require 'search-web)
;; (define-prefix-command 'search-web-map)
;; (global-set-key (kbd "M-i") 'search-web-map)
;; (global-set-key (kbd "M-i g") (lambda () (interactive) (search-web-dwim "google")))
;; (global-set-key (kbd "M-i M-i") (lambda () (interactive) (search-web-dwim)))

;; (defun search-web-dwim (&optional arg-engine)
;;   "transient-mark-mode がオンの時はリージョンを,オフの時はカーソル位置の単語を検索する．"
;;   (interactive)
;;   (cond
;;    (
;;    ;(transient-region-active-p)
;;     (search-web-region arg-engine))
;;    (t
;;     (search-web-at-point arg-engine))))
