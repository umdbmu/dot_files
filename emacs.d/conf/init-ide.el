;; ウィンドウを折り返す
(setq truncate-partial-width-windows nil)

;; helm関連
(use-package helm
  :bind (("M-x" . helm-M-x)
         ("M-y" . helm-show-kill-ring))
  :config
  (helm-mode t))

(use-package helm-cmd-t
  :bind (("C-x g" . helm-cmd-t-grep)))

;; ; (global-set-key (kbd "C-x C-b") 'helm-C-x-b)
;; (add-to-list 'helm-completing-read-handlers-alist '(find-file . nil))

;; タグジャンプを使用可能にする
; (load "init-tag")

;; ブックマーク関連の設定
;; (setq-default bm-buffer-persistence nil)
;; (setq bm-restore-repository-on-load t)
;; (add-hook 'find-file-hook 'bm-buffer-restore)
;; (add-hook 'kill-buffer-hook 'bm-buffer-save)
;; (add-hook 'after-save-hook 'bm-buffer-save)
;; (add-hook 'after-revert-hook 'bm-buffer-restore)
;; (add-hook 'vc-before-checkin-hook 'bm-buffer-save)
;; (add-hook 'kill-emacs-hook '(lambda nil
;; 			      (bm-buffer-save-all)
;; 			      (bm-repository-save)))

;; (setq helm-source-bm (delete '(multiline) helm-source-bm))

;; (defun bm-toggle-or-helm ()
;;   "2回連続で起動したらhelm-bmを実行させる"
;;   (interactive)
;;   (bm-toggle)
;;   (when (eq last-command 'bm-toggle-or-helm)
;;     (helm-bm)))
;; (global-set-key (kbd "M-:") 'bm-toggle-or-helm)

;; gitフロントエンドを使用する
(use-package magit
  :bind (("M-;" . magit-status))
  :config (defadvice magit-status (around magit-fullscreen activate)
	    (window-configuration-to-register :magit-fullscreen)
	    ad-do-it (delete-other-windows)))

(use-package git-gutter
  :config (global-git-gutter-mode t))

;; ediff
; コントロール用のバッファを同一フレーム内に表示
;; (setq ediff-window-setup-function 'ediff-setup-windows-plain)
; diffのバッファを上下ではなく左右に並べる
;; (setq ediff-split-window-function 'split-window-horizontally)

;; 自動補完
;; (use-package auto-complete
;;   :commands auto-complete-mode
;;   :init
;;   (progn
;;    (auto-complete-mote t)
;;    ;; 20行分補完メニューを表示する
;;    (setq ac-menu-height 20)
;; 	   (set-face-background 'ac-selection-face "lightgray")
;; 	   (set-face-foreground 'ac-selection-face "white")
;; 	   (set-face-foreground 'ac-candidate-face "steelblue")
;; 	   (set-face-background 'ac-selection-face "red")
;; 	   (set-face-background 'ac-candidate-face "black")
;; 	   ;; 曖昧検索を有効にする
;; 	   (setq ac-fuzzy-cursor-color t)
;; 	   ;; 補完対象に大文字が含まれる場合のみ区別する
;; 	   (setq ac-ignore-case 'smart))
;;   :bind (("M-<tab>" . auto-complete)
;; 	 ("C-n" . ac-next)
;; 	 ("C-p" . ac-previous)))

;; (define-key ac-complete-mode-map (kbd "C-n") 'ac-next)

;; 選択中にTabで補完完了にし、Retで補完中止にするにする
; (define-key ac-completing-map "\t" 'ac-complete)
; (define-key ac-completing-map "\r" nil)

;; undo-treeモードの設定
;; (require 'undo-tree)
;; (global-undo-tree-mode t)
;; (global-set-key (kbd "M-/") 'undo-tree-redo)

;; smartparens を利用する
;; (require 'smartparens-config)
;; (smartparens-global-mode t)

;; 拡張版diredを使用する
(use-package direx
  :init (defun direx:jump-to-project-directory ()
	     (interactive)
	     (let ((result (ignore-errors
                 (direx-project:jump-to-project-root-other-window) t)))
	       (unless result
		 (direx:jump-to-directory-other-window))))
  :bind ("C-x C-d" . direx:jump-to-project-directory))
;; (require 'direx)
;; (require 'direx-project)

;; (global-set-key (kbd "C-x C-d") 'direx:jump-to-project-directory)

;; anzu-mode
(use-package anzu
  :config ((global-anzu-mode t)
	   (set-face-attribute 'anzu-mode-line nil
			       :foreground "yellow" :weight 'bold)
	   (anzu-deactivate-region t)
	   (anzu-search-threshold 1000)
	   (anzu-replace-to-string-separator " => "))
  :bind (("M-%" . anzu-query-replace)
	 ("C-M-%" . anzu-query-replace-regexp)))

;; (global-set-key (kbd "M-%") 'anzu-query-replace)
;; (global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp)

;; (custom-set-variables
;; '
;; )

;; 各種言語の設定を行う
;; (load "init-lang")
