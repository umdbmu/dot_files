;; anything
;(require 'anything-config)
(require 'anything)
;; anythingでヤンクを遡れるようにする
(global-set-key (kbd "M-y") 'anything-show-kill-ring)
;(setq anything-sources
;     '(anything-c-source-buffers
;	anything-c-source-bookmarks	;anything-c-source-recentf
;	anything-c-source-man-pages
;	anything-c-source-info-pages
;	anything-c-source-calculation-result
;	anything-c-source-files-in-current-dir
;	anything-c-source-emacs-commands
;	anything-c-source-locate))
;(define-key anything-map (kbd "C-p") 'anything-previous-line)
;(define-key anything-map (kbd "C-n") 'anything-next-line)
;(define-key anything-map (kbd "C-v") 'anything-next-page)
;(define-key anything-map (kbd "M-v") 'anything-previous-page)

;(global-set-key (kbd "C-x C-a") 'anything-for-files)

;(require 'descbinds-anything)
;(descbinds-anything-install)
