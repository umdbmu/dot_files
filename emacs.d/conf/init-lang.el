;;;;;;;
;; c ;;
;;;;;;;
(load "init-cc")

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
;; TODO状態
(setq org-todo-keywords
            '((sequence "TODO (t)" "WAIT (w)" "|" "DONE (d)" "SOMEDAY (s)")))
;; DONEの時刻を記録
(setq org-log-done 'time)

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
