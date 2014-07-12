;; PATHの設定を引き継ぐ
; (exec-path-from-shell-initialize)

;; file名の補完で大文字と小文字を区別しない
(setq completion-ignore-case t)

;; バッファ自動再読込み
(global-auto-revert-mode 1)

;; ウィンドウを折り返す
(setq truncate-partial-width-windows nil)

;; 同名ファイルのバッファ名の識別文字列を変更する
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; helmの設定
(when (require 'helm-config nil t)
  (global-set-key (kbd "C-x C-b") 'helm-mini)
  (global-set-key (kbd "M-r") 'helm-resume)
  (global-set-key (kbd "M-y") 'helm-show-kill-ring)
  (global-set-key (kbd "C-x b") 'electric-buffer-list)

  (helm-mode 1)
  (add-to-list 'helm-completing-read-handlers-alist '(find-file . nil)))

;; undohistの設定
(when (require 'undohist nil t)
    (undohist-initialize))

;; undo-treeモードの設定
(when (require 'undo-tree nil t)
  (global-undo-tree-mode)
  (global-set-key (kbd "M-/") 'undo-tree-redo)
  )

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

;; smartparens を利用する
(require 'smartparens-config)
(smartparens-global-mode t)

;; smart-compileを読み込む
(require 'smart-compile)
(autoload 'smart-compile "smart-compile" "when compiling")
(global-set-key (kbd "C-c c") 'smart-compile)

;; 拡張版diredを使用する
(require 'direx)

;; ポモドーロタイマーを使う
; (require 'pomodoro)

;; elファイル保存時にauto-async-byte-compileを実行する
(require 'auto-async-byte-compile)
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)

;; popwinの設定
(require 'popwin)
;(setq display-buffer-alist 'popwin:display-buffer)
;(setq display-buffer-function 'popwin:display-buffer)
(push '("*Buffer List*" :position left :width 50) popwin:special-display-config)
(push '("*dvi-preview") popwin:special-display-config)
(push '("*multi-term*" :position bottom :width 50) popwin:special-display-config)
(push '(":home" :position left :width 50) popwin:special-display-config)
(push '("*YaTeX-typesetting*" :position left :width 50) popwin:special-display-config)
(push '("*auto-async-byte-compile*" :height 14 :position bottom :noselect t) popwin:special-display-config)
(push '("*VC-log*" :height 10 :position bottom) popwin:special-display-config)
(push '("eproject" :height 10 :position bottom) popwin:special-display-config)
;(push '(" *auto-async-byte-compile*" :position bottom :width 50 :noselect t) popwin:special-display-config)
;(push '("*shell*") popwin:special-display-config)

;;汎用機の SPF (mule みたいなやつ) には
;;画面を 2 分割したときの 上下を入れ替える swap screen
;;というのが PF 何番かにわりあてられていました。
(defun swap-screen ()
    "Swap two screen,leaving cursor at current window."
      (interactive)
        (let ((thiswin (selected-window))
	              (nextbuf (window-buffer (next-window))))
	      (set-window-buffer (next-window) (window-buffer))
	          (set-window-buffer thiswin nextbuf)))
(defun swap-screen-with-cursor ()
    "Swap two screen,with cursor in same buffer."
      (interactive)
        (let ((thiswin (selected-window))
	              (thisbuf (window-buffer)))
	      (other-window 1)
	          (set-window-buffer thiswin (window-buffer))
		      (set-window-buffer (selected-window) thisbuf)))
(global-set-key [f2] 'swap-screen)
(global-set-key [S-f2] 'swap-screen-with-cursor)

;; anzu-mode
(global-anzu-mode t)
(global-set-key (kbd "M-%") 'anzu-query-replace)
(global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp)
(set-face-attribute 'anzu-mode-line nil
		    :foreground "yellow" :weight 'bold)
(custom-set-variables
  '(anzu-mode-lighter "")
 '(anzu-deactivate-region t)
 '(anzu-search-threshold 1000)
 '(anzu-replace-to-string-separator " => "))
