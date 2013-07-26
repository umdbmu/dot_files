;; PATHの設定を引き継ぐ
; (exec-path-from-shell-initialize)

;; file名の補完で大文字と小文字を区別しない
(setq completion-ignore-case t)

;; バッファ自動再読込み
(global-auto-revert-mode 1)

;; 同名ファイルのバッファ名の識別文字列を変更する
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; undohistの設定
(when (require 'undohist nil t)
    (undohist-initialize))

;; undo-treeモードの設定
(when (require 'undo-tree nil t)
    (global-undo-tree-mode))

(defun split-window-vertically-n (num_wins)
    (interactive "p")
      (if (= num_wins 2)
	        (split-window-vertically)
	    (progn
	            (split-window-vertically
		            (- (window-height) (/ (window-height) num_wins)))
		          (split-window-vertically-n (- num_wins 1)))))
(defun split-window-horizontally-n (num_wins)
    (interactive "p")
      (if (= num_wins 2)
	        (split-window-horizontally)
	    (progn
	            (split-window-horizontally
		            (- (window-width) (/ (window-width) num_wins)))
		          (split-window-horizontally-n (- num_wins 1)))))

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

;; 終了時の状態を保存
;; (require 'desktop)
;; (desktop-save-mode 1)

;; auto-pairを利用する
(require 'flex-autopair)
(flex-autopair-mode 1)

;; smart-compileを読み込む
(require 'smart-compile)
(autoload 'smart-compile "smart-compile" "when compiling")
(global-set-key (kbd "C-c c") 'smart-compile)

;; ;; hownメモ保存の場所
;; (setq howm-directory(concat user-emacs-directory "howm"))
;; ;; hown-menuの言語を日本語に
;; (setq howm-menu-lang 'ja)
;; ;; hownメモを一日1ファイルにする
;; (setq howm-file-name-format "%Y/%m%Y-%m-%d.howm")
;; ;; honw-modeを読み込む
;; (when (require 'howm-mode nil t)
;;   ;; C-c,, でhown-meneを起動
;;   (define-key global-map (kbd "C-c ,,") 'howm-menu))
;; ;; howmメモを保存と同時に閉じる
;; (defun howm-save-buffer-and-kill()
;;   (interactive)
;;   (when (and (buffer-file-name)
;; 	     (string-match "\\.howm" (buffer-file-name)))
;;     (save-buffer)
;;     (kill-buffer nil)))
;; ;; C-c C-cでメモの保存と同時にバッファを閉じる
;; (define-key howm-mode-map (kbd "C-c C-c") 'howm-save-buffer-and-kill)

;; 拡張版diredを使用する
; (require 'direx)

;; ポモドーロタイマーを使う
; (require 'pomodoro)
