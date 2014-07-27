;;; 見た目に関する設定

;; フォントを変更する
(set-face-attribute 'default nil
		    :family "Ricty"
		    :height 110)

;; 画面下に現在の関数名を表示する
(which-function-mode 1)

(if (fboundp 'set-scroll-bar-mode) (set-scroll-bar-mode nil))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
;; 対応する括弧のハイライト
(setq show-paren-mode-delay 0)
(show-paren-mode t)
;; parenのスタイル
(setq show-paren-style 'expression)
(set-face-background 'show-paren-match-face "NavyBlue")

;(setq hi-line-face '((:background "NavyBlue" t)(t(:bold t))))
(global-hl-line-mode t)

;; 配色決定
;; version23以前は独自で配色を指定する
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
  (add-to-list 'custom-theme-load-path "~/.emacs.d/public_repos/replace-colorthemes"))
