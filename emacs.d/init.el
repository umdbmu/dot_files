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

(prefer-coding-system 'utf-8-unix)

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
'(shell-pop-window-height 25)
'(shell-pop-window-position "bottom")
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(anzu-deactivate-region t)
 '(anzu-replace-to-string-separator " => ")
 '(anzu-search-threshold 1000)
 '(custom-safe-themes
   (quote
    ("790e74b900c074ac8f64fa0b610ad05bcfece9be44e8f5340d2d94c1e47538de" "146cc293f18ea1e17d29833b495193d0455bf1e2b30ecc0f2551a77027338576" "90d329edc17c6f4e43dbc67709067ccd6c0a3caa355f305de2041755986548f2" default)))
 '(fci-rule-color "#383838")
 '(org-plantuml-jar-path "~/plantuml.jar")
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(hl-line ((t (:background "color-236")))))
