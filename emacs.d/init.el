;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(when (> emacs-major-version 23)
  (defvar user-emacs-directory "~/.emacs.d/"))
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
	      (expand-file-name (concat user-emacs-directory path))))
	(add-to-list 'load-path default-directory)
	(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
	    (normal-top-level-add-subdirs-to-load-path))))))

(add-to-load-path "elisp" "conf" "public_repos" "info" "share" "elpa")

;; package.elの設定
(when (require 'package nil t)
  ;; パッケージリポジトリにMarmaladeqと開発者運営のELPAを追加
  ; (add-to-list 'package-archives '("ELPA" . "http://tromey.com/elpa/"))
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
  ;; インストールしたパッケージにロードパスを通して読み込む
  (package-initialize))
(require 'cl)

;; install use-package if not installed.
(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(load "init-layout")


;; (when (>= emacs-major-version 24)
;;   (when (>= emacs-minor-version 4)
;;     (setq load-prefer-newer t))
;;   ;; 設定に必要なパッケージのインストール
;;   (load "install-package")
;;   (require 'compile)
;;   ;; 見た目の設定をする

;;   ;; 便利設定をまとめて読み込む
(load "init-utils")

;;   ;; shellの設定
;;   (load "init-shell")

;; 開発環境を整える
(load "init-ide")
;;   )

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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(anzu-deactivate-region t)
 '(anzu-replace-to-string-separator " => ")
 '(anzu-search-threshold 1000)
 '(custom-safe-themes
   (quote
    ("4e753673a37c71b07e3026be75dc6af3efbac5ce335f3707b7d6a110ecb636a3" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(hl-line ((t (:background "color-236")))))
