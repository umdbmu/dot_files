;;; 見た目に関する設定

;; フォントを変更する
(set-face-attribute 'default nil
		    :family "Ricty"
		    :height 110)

;; 行と桁を画面下に表示
(if (fboundp 'line-number-mode) (line-number-mode t))
(column-number-mode t)
;; 選択範囲の文字数を画面下に表示
(defun count-lines-and-chars ()
  (if mark-active
      (format "[%3d:%4d]"
	      (count-lines (region-beginning) (region-end))
	      (- (region-end) (region-beginning)))
    ""))
(add-to-list 'mode-line-format
	     '(:eval (count-lines-and-chars)))
(add-to-list 'custom-theme-load-path "~/.emacs.d/public_repos/replace-colorthemes")

;; 画面下に時刻を表示
(display-time)
(setq appt-display-duration 60)

;; 画面下に現在の関数名を表示する
(which-function-mode 1)

;; tabbarの設定をする
; (load "init-tabbar")

(if (fboundp 'set-scroll-bar-mode) (set-scroll-bar-mode nil))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
;; 対応する括弧のハイライト
(setq show-paren-mode-delay 0)
(show-paren-mode t)
;; parenのスタイル
(setq show-paren-style 'expression)
(setq hl-line-face 'my-hl-line-face)
(global-hl-line-mode t)

;; 配色決定
;; version24以降はcustomize-themeを使う
(if (< emacs-major-version 23)
    (
     ;; 文字の色を設定
     (set-foreground-color "black")
     ;; 背景色を設定
     (set-background-color "misty rose")
     ;; ミニバッファの色を変更
     (set-face-foreground 'minibuffer-prompt "goldenrod")
     (set-face-foreground 'font-lock-function-name-face "white")
     (set-face-foreground 'font-lock-preprocessor-face "tomato")
     (set-face-foreground 'font-lock-string-face "gold")
     (set-face-foreground 'font-lock-builtin-face "violetred")
     ;; アクティブでないバッファの背景色を変更
     (set-face-background 'mode-line-inactive "turquoise4")
     ;; アクティブでないバッファの文字色を変更
     (set-face-foreground 'mode-line-inactive "turquoise3")
     ;; アクティブのバッファの背景色を変更
     (set-face-background 'mode-line "dark")
     ;; アクティブのバッファの文字色を変更
     (set-face-foreground 'mode-line "white")
     (set-face-foreground 'font-lock-comment-face "HotPink")
     (set-face-foreground 'font-lock-comment-delimiter-face "HotPink")
     (set-face-foreground 'font-lock-variable-name-face "firebrick4")
     ;; 両脇のバーの文字色
     (set-face-foreground 'fringe "NavajoWhite4")
     ;; 両脇のバーの背景色
     (set-face-background 'fringe "NavajoWhite4"))
  (custom-set-variables
   '(ansi-color-names-vector ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
   '(custom-enabled-themes (quote (manoj-dark)))
   '(custom-safe-themes (quote ("6cfe5b2f818c7b52723f3e121d1157cf9d95ed8923dbc1b47f392da80ef7495d" default)))
   )
  (add-to-list 'custom-theme-load-path "~/.emacs.d/public_repos/replace-colorthemes"))
