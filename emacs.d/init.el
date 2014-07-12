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
  ;; (load "init-input")

  ;; 開発環境を整える
  (load "init-ide")

  ;; web周りを整える
  ;(load "init-web") 
  )

;; 通常のkey割り当てを変更する
(load "init-keymap")

;; Windowsの場合のファイル名の変更
(when (eq window-system 'w32)
  (set-file-name-coding-system 'cp932)
  (setq locale-coding-system 'cp932))
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(ansi-color-names-vector ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
;;  '(anzu-deactivate-region t)
;;  '(anzu-mode-lighter "")
;;  '(anzu-replace-to-string-separator " => ")
;;  '(anzu-search-threshold 1000)
;;  '(custom-safe-themes (quote ("6cfe5b2f818c7b52723f3e121d1157cf9d95ed8923dbc1b47f392da80ef7495d" default)))
;;  '(shell-pop-shell-type (quote ("multi-term" "*multi-term*" (lambda nil (multi-term)))))
;;  '(shell-pop-window-height 25)
;;  '(shell-pop-window-position "bottom")
;;  '(yas-trigger-key "TAB"))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )
