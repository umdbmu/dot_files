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

;; popwinの設定
(require 'popwin)
;(setq display-buffer-alist 'popwin:display-buffer)
(push '("*Buffer List*" :position left :width 50) popwin:special-display-config)
(push '("*dvi-preview") popwin:special-display-config)
(push '(":home" :position left :width 50) popwin:special-display-config)
(push '("*YaTeX-typesetting*" :position left :width 50) popwin:special-display-config)
;(push '("*shell*") popwin:special-display-config)

;; (require 'e2wm-vcs)
;; (e2wm:add-keymap
;;  e2wm:pst-minor-mode-keymap
;;  '(("<M-left>". e2wm:dp-code)		;code-mode
;;    ("<M-right>". e2wm:dp-two)		;two-mode
;;    ("<M-up>". e2wm:dp-doc)		;doc-mode
;;    ("<M-down>".e2wm:dp-dashboard)	;dashboard-mode
;;    ("<M-*>". e2wm:dp-magit)
;;    ) e2wm:prefix-key)
;; (require 'e2wm)

; (global-set-key (kbd "M-+") 'e2wm:start-management)
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(magit-git-executable "C:/Program Files (x86)/Git/bin/git.exe"))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )

;; 配色決定
;; version24以降はcustomize-themeを使う
(if (< emacs-major-version 24)
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
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   ))
