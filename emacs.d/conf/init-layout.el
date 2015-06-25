;;; 見た目に関する設定
;; フォントを変更する
(set-face-attribute 'default nil
		    :family "Ricty"
		    :height 110)

(if (fboundp 'set-scroll-bar-mode) (set-scroll-bar-mode nil))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

(load-theme 'misterioso t)
(custom-set-faces
'(hl-line ((t (:background "color-236")))))

;; 対応する括弧のハイライト
(setq show-paren-mode-delay 0)
(show-paren-mode t)
;; parenのスタイル
(setq show-paren-style 'expression)
(set-face-background 'show-paren-match-face "NavyBlue")

;(setq hi-line-face '((:background "NavyBlue" t)(t(:bold t))))
(global-hl-line-mode t)

(require 'whitespace)
(setq whitespace-style '(face           ; faceで可視化
			 trailing       ; 行末
			 tabs           ; タブ
			 spaces         ; スペース
			 empty          ; 先頭/末尾の空行
			 space-mark     ; 表示のマッピング
			 tab-mark
			 ))

(setq whitespace-display-mappings
      '((space-mark ?\u3000 [?\u25a1])
	;; WARNING: the mapping below has a problem.
	;; When a TAB occupies exactly one column, it will display the
	;; character ?\xBB at that column followed by a TAB which goes to
	;; the next TAB column.
	;; If this is a problem for you, please, comment the line below.
	(tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))

;; スペースは全角のみを可視化
(setq whitespace-space-regexp "\\(\u3000+\\)")
;; 保存前に自動でクリーンアップ
(setq whitespace-action '(auto-cleanup))
(global-whitespace-mode 1)

(defvar my/bg-color "#232323")
(set-face-attribute 'whitespace-trailing nil
		    :background my/bg-color
		    :foreground "DeepPink"
		    :underline t)
(set-face-attribute 'whitespace-tab nil
		    :background my/bg-color
		    :foreground "LightSkyBlue"
		    :underline t)
(set-face-attribute 'whitespace-space nil
		    :background my/bg-color
		    :foreground "GreenYellow"
		    :weight 'bold)
(set-face-attribute 'whitespace-empty nil
		    :background my/bg-color)

;;; mode-lineのレイアウト
;; 画面下に現在の関数名を表示する
(which-function-mode 1)

;; powerlineを利用する
(load "init-powerline")

;;; modeの名前を自分で再定義
(defvar mode-line-cleaner-alist
  '(
    ;; mode-lineに表示する文字列
    ;; minor-mode
    (flymake-mode . " Fm")
    (undo-tree-mode . "")
    (git-gutter-mode . "")
    (helm-mode . "")
    (anzu-mode . "")
    (magit-auto-revert-mode . " Re")
    (abbrev-mode . "")

    ;; major-mode
    (fundamental-mode . "Fund")
    (dired-mode . "Dir")
    (lisp-interaction-mode . "Li")
    (cperl-mode . "Pl")
    (python-mode . "Py")
    (php-mode . "Ph")
    (ruby-mode   . "Rb")
    (emacs-lisp-mode . "El")
    (markdown-mode . "Md")))

(defun clean-mode-line ()
  (interactive)
  (loop for (mode . mode-str) in mode-line-cleaner-alist
	do
	(let ((old-mode-str (cdr (assq mode minor-mode-alist))))
	  (when old-mode-str
	    (setcar old-mode-str mode-str))
	  ;; major mode
	  (when (eq mode major-mode)
	    (setq mode-name mode-str)))))

(add-hook 'after-change-major-mode-hook 'clean-mode-line)
