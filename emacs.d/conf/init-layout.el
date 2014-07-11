;;; 見た目に関する設定

;; フォントを変更する
(set-face-attribute 'default nil
		    :family "Ricty"
		    :height 110)

;; 行と桁を画面下に表示
;; (if (fboundp 'line-number-mode) (line-number-mode t))
;; (column-number-mode t)
;; ;; 選択範囲の文字数を画面下に表示
;; (defun count-lines-and-chars ()
;;   (if mark-active
;;       (format "[%3d:%4d]"
;; 	      (count-lines (region-beginning) (region-end))
;; 	      (- (region-end) (region-beginning)))
;;     ""))
;; (add-to-list 'mode-line-format
;; 	     '(:eval (count-lines-and-chars)))

;; 画面下に時刻を表示
;; (display-time)
;; (setq appt-display-duration 60)

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
   ;; (require 'ansi-color)
   ;; (defun display-ansi-colors ()
   ;;     (interactive)eJd
   ;;       (ansi-color-apply-on-region (point-min) (point-max)))
   ;; '(ansi-color-names-vector ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
   '(custom-enabled-themes (quote (tango-dark)))
   ;; '(custom-safe-themes (quote ("6cfe5b2f818c7b52723f3e121d1157cf9d95ed8923dbc1b47f392da80ef7495d" default)))
   )
  (add-to-list 'custom-theme-load-path "~/.emacs.d/public_repos/replace-colorthemes"))

;;; modeの名前を自分で再定義
;; (defvar mode-line-cleaner-alist
;;   '( ;; For minor-mode, first char is 'space'
;;     (flymake-mode . " Fm")
;;     (helm-mode . "")
;;     (paredit-mode . "")
;;     (eldoc-mode . "")
;;     (abbrev-mode . "")
;;     (global-undo-tree-mode . "")
;;     (git-gutter-mode . "")
;;     (anzu-mode . "")
;;     (yas-minor-mode . "")
;;     (guide-key-mode . "")
;;     (smartparens-mode . "")

;;     ;; Major modes
;;     (fundamental-mode . "Fund")
;;     (dired-mode . "Dir")
;;     (lisp-interaction-mode . "Li")
;;     (cperl-mode . "Pl")
;;     (python-mode . "Py")
;;     (ruby-mode   . "Rb")
;;     (emacs-lisp-mode . "El")
;;     (markdown-mode . "Md")))

;; (defun clean-mode-line ()
;;   (interactive)
;;   (loop for (mode . mode-str) in mode-line-cleaner-alist
;; 	do
;; 	(let ((old-mode-str (cdr (assq mode minor-mode-alist))))
;; 	  (when old-mode-str
;; 	    (setcar old-mode-str mode-str))
;; 	  ;; major mode
;; 	  (when (eq mode major-mode)
;; 	    (setq mode-name mode-str)))))

;; (add-hook 'after-change-major-mode-hook 'clean-mode-line)

(require 'powerline)
(set-face-attribute 'mode-line nil
		    :foreground "#fff"
		    :background "color-203"
		    :box nil)

;; (set-face-attribute 'powerline-active1 nil
;; 		    :foreground "black"
;; 		    :background "color-207"
;; 		    :inherit 'mode-line)

(set-face-attribute 'powerline-active2 nil
		    :foreground "#000"
		    :background "#ffaeb9"
		    :inherit 'mode-line)
(defun powerline-custome-theme ()
  "Setup a mode-line with major and minor modes centered."
  (interactive)
  (setq-default mode-line-format
                '("%e"
                  (:eval
                   (let* ((active (powerline-selected-window-active))
                          (mode-line (if active 'mode-line 'mode-line-inactive))
                          (face1 (if active 'powerline-active1 'powerline-inactive1))
                          (face2 (if active 'powerline-active2 'powerline-inactive2))
                          (separator-left (intern (format "powerline-%s-%s"
                                                          powerline-default-separator
                                                          (car powerline-default-separator-dir))))
                          (separator-right (intern (format "powerline-%s-%s"
                                                           powerline-default-separator
                                                           (cdr powerline-default-separator-dir))))
                          (lhs (list ;; (powerline-buffer-size nil 'l)
				     ;; (powerline-buffer-id nil 'l)
                                     (powerline-raw "%4l/" nil 'l)
				     (powerline-raw  (number-to-string (count-lines (point-min) (point-max))))
				     (powerline-raw " ")
				     (funcall separator-left mode-line face1)
				     (powerline-narrow face1 'l)
				     (powerline-vc face1)))
                          (rhs (list (powerline-raw global-mode-string face1 'r)
				     (powerline-raw "%Z:" nil 'r)
				     (powerline-raw "%*" nil 'r)
				     ;; (powerline-raw "%4l" nil 'r)
                                     ;; (powerline-raw ":" face1)
                                     ;; (powerline-raw "%3c" face1 'r)
                                     (funcall separator-right face1 mode-line)
                                     ;; (powerline-raw " ")
                                     (powerline-hud face2 face1)))
                          (center (list (powerline-raw " " face1)
                                        (funcall separator-left face1 face2)
                                        (when (boundp 'erc-modified-channels-object)
                                          (powerline-raw erc-modified-channels-object face2 'l))
                                        ;; (powerline-major-mode face2 'l)
                                        (powerline-process face2)
                                        ;; (powerline-raw " :" face2)
                                        ;; (powerline-minor-modes face2 'l)
                                        ;; (powerline-raw " " face2)
                                        (funcall separator-right face2 face1))))
                     (concat (powerline-render lhs)
                             (powerline-fill-center face1 (/ (powerline-width center) 2.0))
                             (powerline-render center)
                             (powerline-fill face1 (powerline-width rhs))
                             (powerline-render rhs)))))))
