;; PATHの設定を引き継ぐ
; (exec-path-from-shell-initialize)

;; file名の補完で大文字と小文字を区別しない
(setq completion-ignore-case t)

;; バッファ自動再読込み
(global-auto-revert-mode 1)

;; 同名ファイルのバッファ名の識別文字列を変更する
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; helmの設定
;; (when (require 'helm-config nil t)
;;   (global-set-key (kbd "C-x C-b") 'helm-mini)
;;   (global-set-key (kbd "M-r") 'helm-resume)
;;   (global-set-key (kbd "M-y") 'helm-show-kill-ring)
;;   (global-set-key (kbd "C-x b") 'electric-buffer-list)

;;   (helm-mode 1)
;;   (add-to-list 'helm-completing-read-handlers-alist '(find-file . nil)))

;; window を縦に二分割する
(defun split-window-vertically-n (num_wins)
  (interactive "p")
  (if (= num_wins 2)
      (split-window-vertically)
    (progn
      (split-window-vertically
       (- (window-height) (/ (window-height) num_wins)))
      (split-window-vertically-n (- num_wins 1)))))
;; window を横に二分割する
(defun split-window-horizontally-n (num_wins)
  (interactive "p")
  (if (= num_wins 2)
      (split-window-horizontally)
    (progn
      (split-window-horizontally
       (- (window-width) (/ (window-width) num_wins)))
      (split-window-horizontally-n (- num_wins 1)))))
;; 現在の画面サイズに応じてどのように分割するか決める
(defun other-window-or-split ()
  (interactive)
  (when (one-window-p)
    (if (>= (window-body-width) 270)
	(split-window-horizontally-n 3)
      (split-window-horizontally)))
  (other-window 1))

;; "C-t"でウィンドウを切り替える。初期値はtranspose-chars
(global-set-key (kbd "C-t") 'other-window-or-split)

;; backupファイルを一つのフォルダにまとめて保存する
(setq make-backup-files t)
;; backupフォルダの指定
(setq backup-directory-alist
      (cons (cons "\\.*$" (expand-file-name "~/.emacs.d/backup"))
	    backup-directory-alist))

;; popwinの設定
(require 'popwin)
(popwin-mode nil)
;(setq display-buffer-alist 'popwin:display-buffer)
;(setq display-buffer-function 'popwin:display-buffer)
(push '("*Buffer List*" :position left :width 50) popwin:special-display-config)
(push '("*dvi-preview") popwin:special-display-config)
(push '("*multi-term*" :position bottom :width 50) popwin:special-display-config)
(push '(":home" :position left :width 50) popwin:special-display-config)
(push '("*YaTeX-typesetting*" :position left :width 50) popwin:special-display-config)
(push '("*Backtrace*" :height 14 :position bottom :noselect t) popwin:special-display-config)
(push '(" *auto-async-byte-compile*" :height 14 :position bottom :noselect t) popwin:special-display-config)
(push '("*VC-log*" :height 10 :position bottom) popwin:special-display-config)
(push '("eproject" :height 10 :position bottom) popwin:special-display-config)
					;(push '(" *auto-async-byte-compile*" :position bottom :width 50 :noselect t) popwin:special-display-config)
(push '("*shell-" :regexp t :position bottom) popwin:special-display-config)
(push '("*helm" :regexp t :position bottom) popwin:special-display-config)
(push '(direx:direx-mode :position left :width 25 :dedicated t) popwin:special-display-config)

;; １行づつスクロールする
(setq scroll-conservatively 35
      scroll-margin 0
      scroll-step 1)
