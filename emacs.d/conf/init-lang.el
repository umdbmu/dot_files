;;;;;;;
;; c ;;
;;;;;;;
;; (load "init-cc")

 ;;;;;;;;;;;;;;
;; Markdown ;;
 ;;;;;;;;;;;;;;
;; .mkファイルをmarkdown-modeで開く
(setq auto-mode-alist
      (cons '("\\.mk?d$" .markdown-mode) auto-mode-alist))
;; (add-hook 'markdown-mode-hook 'flyspell-mode)
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
;; 見出しの余分な*を消す
(setq org-hide-leading-stars t)
(setq org-default-notes-file (concat "/GTD/note.org"))
(define-key global-map "\C-cc" 'org-capture)
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "/GTD/inbox.org" "Inbox") "* TODO %?\n %i\n %a")
	("h" "Hirameki" entry (file+headline "/GTD/inbox.org" "Hirameki") "* HIRAMEKi %?\n %i\n %a")))

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
;; (load "init-perl")

;;;;;;;
;; R ;;
;;;;;;;
;; (load "init-R")

;;;;;;;;;;
;; HTML ;;
;;;;;;;;;;
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html$" . web-mode))

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

;;;;;;;;;;
;; HTML ;;
;;;;;;;;;;
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html$" . web-mode))

;;;;;;;;;;;;;;;;
;; javascript ;;
;;;;;;;;;;;;;;;;
(require 'js2-mode)
(autoload 'tern-mode "tern.el" nil t)
(setq js2-mode-hook
      '(lambda()
	 (setq js2-basic-offset 2)
	 (setq-default tab-width 4 indent-tabs-mode nil)
	 (tern-mode t)))
(eval-after-load 'tern
  '(progn
     (require 'tern-auto-complete)
     (tern-ac-setup)))
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;;;;;;;;;
;; PHP ;;
;;;;;;;;;


;;;;;;;;;;;;;;;;
;; emacs lisp ;;
;;;;;;;;;;;;;;;;
;; smart-compileを読み込む
(require 'smart-compile)
(autoload 'smart-compile "smart-compile" "when compiling")
(global-set-key (kbd "C-c c") 'smart-compile)

;; elファイル保存時にauto-async-byte-compileを実行する
(require 'auto-async-byte-compile)
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)
