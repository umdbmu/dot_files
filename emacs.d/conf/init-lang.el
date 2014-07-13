;;;;;;;
;; c ;;
;;;;;;;
;(load "init-cc")

 ;;;;;;;;;;;;;;
 ;; Markdown ;;
 ;;;;;;;;;;;;;;
;; .mkファイルをmarkdown-modeで開く
(setq auto-mode-alist
      (cons '("\\.mk?d$" .markdown-mode) auto-mode-alist))
;(add-hook 'markdown-mode-hook 'flyspell-mode)
;; Marked でmarkdownファイルをプレビューする (Mac OSX時)
(when (eq system-type 'darwin)
  (defun markdown-preview-file ()
    "run Marked on the current file and revert the buffer"
    (interactive)
    (shell-command
     (format "open -a /Applications/Marked.app %s"
	     (shell-quote-argument (buffer-file-name))))
    )
  (global-set-key "\C-cm" 'markdown-preview-file))

;;;;;;;;;
;; org ;;
;;;;;;;;;
;; org-modeでソースコードの挿入を綺麗にする
(setq org-src-fontify-natively t)
;; DONEの時刻を記録
(setq org-log-done 'time)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cr" 'org-remember)
;; 見出しの余分な*を消す
(setq org-hide-leading-stars t)
(setq org-agenda-custom-commands
      '(
	("p" "Projects"
	 ((tags "PROJECT")))
	("h" "Office and Home Lists"
	 ((agenda)
	  (tags-todo "OFFICE")
	  (tags-todo "HOME")
	  (tags-todo "WEB")
	  (tags-todo "CALL")
	  ))

	("d" "Daily Action List"
	 (
	  (agenda "\" ((org-agenda-ndays 1)
(org-agenda-sorting-strategy
 (quote ((agenda time-up priority-down tag-up) )))
(org-deadline-warning-days 0)
))))))
\"")))))
;;;;;;;;;;;
;; YaTeX ;;
;;;;;;;;;;;
;; texファイルをyatexモードで開く
(setq auto-mode-alist
      (append '(("\\.tex$" . yatex-mode)) auto-mode-alist))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(setq YaTeX-inhibit-prefix-letter t)

;;;;;;;;
;; Go ;;
;;;;;;;;
;; go言語の設定をする
(load "init-go")

;;;;;;;;;;;;
;; python ;;
;;;;;;;;;;;;
;; pythonの自動補完
;; (require 'ac-python)
;; (autoload 'python-mode "python-mode" "Python editing mode." t)

;;;;;;;;;;
;; Perl ;;
;;;;;;;;;;
;; perlの設定をする
; (load "init-perl")

;;;;;;;
;; R ;;
;;;;;;;
; (load "init-R")

;;;;;;;;;;
;; HTML ;;
;;;;;;;;;;
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html$" . web-mode))

;;;;;;;;;;;;;;;;
;; javascript ;;
;;;;;;;;;;;;;;;;
(require 'js2-mode)
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
