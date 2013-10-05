(when (> emacs-major-version 23)
  (defvar user-emacs-directory "~/.emacs.d/"))
;;load-path を追加する関数を定義
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
	      (expand-file-name (concat user-emacs-directory path))))
	(add-to-list 'load-path default-directory)
	(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
	    (normal-top-level-add-subdirs-to-load-path))))))

(add-to-load-path "elisp" "conf" "public_repos" "info" "share" "elpa")

;; 見た目の設定をする
(load "init-layout")

(when (>= emacs-major-version 24)
  ;; 設定に必要なパッケージのインストール
  (load "install-package")

  ;; 便利設定をまとめて読み込む
  (load "init-utils")

  ;; shellの設定
  (load "init-shell")

  ;; 入力関係
  (load "init-input")

  ;; 開発環境を整える
  (load "init-ide")

  ;; web周りを整える
  (load "init-web") 
  )

;; 通常のkey割り当てを変更する
(load "init-keymap")

;; Windowsの場合のファイル名の変更
(when (eq window-system 'w32)
  (set-file-name-coding-system 'cp932)
  (setq locale-coding-system 'cp932))


