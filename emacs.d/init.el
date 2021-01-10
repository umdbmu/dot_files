;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
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
  ; (load "init-shell")

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


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(anzu-deactivate-region t)
 '(anzu-replace-to-string-separator " => ")
 '(anzu-search-threshold 1000)
 '(package-selected-packages
   (quote
    (zenburn-theme yascroll smartparens sequential-command pos-tip popwin open-junk-file magit helm-cmd-t helm git-gutter fuzzy elscreen direx buffer-move auto-complete auto-async-byte-compile anzu))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(markdown-header-face-1 ((t (:inherit org-level-1))))
 '(markdown-header-face-2 ((t (:inherit org-level-2))))
 '(markdown-header-face-3 ((t (:inherit org-level-3))))
 '(markdown-header-face-4 ((t (:inherit org-level-4))))
 '(markdown-header-face-5 ((t (:inherit org-level-5))))
 '(markdown-header-face-6 ((t (:inherit org-level-6)))))
