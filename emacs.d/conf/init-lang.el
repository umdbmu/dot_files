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
(setq org-agenda-files '("~/wiki/tasks"))
;; 見出しの余分な*を消す
(setq org-hide-leading-stars t)
(setq org-default-notes-file (concat "~/wiki/tasks/note.org"))
(define-key global-map "\C-cc" 'org-capture)
(define-key global-map "\C-cl" 'org-store-link)
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/wiki/tasks/inbox.org" "Inbox") "* TODO %?\n %i\n %a")
	("h" "Hirameki" entry (file+headline "~/wiki/tasks/inbox.org" "Hirameki") "* HIRAMEKi %?\n %i\n %a")))
(require 'open-junk-file)
(setq open-junk-file-format "~/wiki/junk/%Y-%m.org")
(global-set-key "\C-xj" 'open-junk-file)

(setq org-agenda-skip-deadline-if-done nil)
(setq org-agenda-skip-scheduled-if-done nil)
(setq org-hierarchical-checkbox-statistics t)
(setq org-log-into-drawer t)

(defun my-org-clocktable-indent-string (level)
  (if (= level 1)
      ""
    (let ((str (format "%d" (- level 1))))
      (while (> level 2)
        (setq level (1- level)
              str (format "%s  " str)))
      (format "%s\\__"str))))

(advice-add 'org-clocktable-indent-string :override #'my-org-clocktable-indent-string)

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
;; (require 'smart-compile)
;; (autoload 'smart-compile "smart-compile" "when compiling")
;; (global-set-key (kbd "C-c c") 'smart-compile)

;; elファイル保存時にauto-async-byte-compileを実行する
(require 'auto-async-byte-compile)
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)

;;;;;;;;;;;;;;
;; web-mode ;;
;;;;;;;;;;;;;;
(require 'web-mode)
;; 拡張子の設定
(add-to-list 'auto-mode-alist '("\\.phtml$"     . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x$"   . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?$"     . web-mode))
(defun web-mode-indent (num)
  (interactive "nIndent: ")
  (setq web-mode-markup-indent-offset num)
  (setq web-mode-css-indent-offset num)
  (setq web-mode-style-padding num)
  (setq web-mode-code-indent-offset num)
  (setq web-mode-script-padding num)
  (setq web-mode-block-padding num)
  )
;; インデント関係
(defun web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-html-offset   4)
  (setq web-mode-css-offset    4)
  (setq web-mode-script-offset 4)
  (setq web-mode-php-offset    4)
  (setq web-mode-java-offset   4)
  (setq web-mode-asp-offset    4)
  (setq indent-tabs-mode t)
  (setq tab-width 4))
(add-hook 'web-mode-hook 'web-mode-hook)

(add-hook 'php-mode-hook
	  '(lambda()
	     (setq tab-width 4)
	     (setq indent-tabs-mode t)
	     (setq c-basic-offset 4)
	     (web-mode-indent 4)
	     (add-hook 'after-save-hook 'helm-gtags-update-tags)
))
