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

(when (>= emacs-major-version 24)
  (when (>= emacs-minor-version 4)
    (setq load-prefer-newer t))
  ;; 設定に必要なパッケージのインストール
  (load "install-package")
  (require 'compile)
  ;; 見た目の設定をする
  (load "init-layout")

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


'(anzu-deactivate-region t)
'(anzu-mode-lighter "")
'(anzu-replace-to-string-separator " => ")
'(anzu-search-threshold 1000)
'(bmkp-last-as-first-bookmark-file "~/.emacs.d/bookmarks")
'(custom-enabled-themes (quote (hc-zenburn)))
'(custom-safe-themes (quote ("4217c670c803e8a831797ccf51c7e6f3a9e102cb9345e3662cc449f4c194ed7d" "9dae95cdbed1505d45322ef8b5aa90ccb6cb59e0ff26fef0b8f411dfc416c552" "146d24de1bb61ddfa64062c29b5ff57065552a7c4019bee5d869e938782dfc2a" "dc77fb4e02417a6a932599168bd61927f6f2fe4fe3dbc4e4086a0bfb25babd67" default)))
'(js2-basic-offset 2)
'(js2-bounce-indent-p nil)
'(org-agenda-files (quote ("/GTD/inbox.org" "/GTD/tasks.org")))
'(shell-pop-window-height 25)
'(shell-pop-window-position "bottom")
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
