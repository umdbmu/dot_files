;; タグジャンプを使用可能にする
(load "init-tag")

;; プロジェクト管理する
(require 'eproject)

;; gitフロントエンドを使用する
(require 'magit)
(require 'helm-ls-git)
(require 'helm-gist)

(global-set-key (kbd "C-x C-d") 'helm-ls-git-ls)

;; 自動補完
 (require 'auto-complete)
(global-auto-complete-mode t)
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
;; (define-key ac-complete-mode-map (kbd "C-n") 'ac-next)
(setq ac-use-menu-map t)
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)
;; 20行分補完メニューを表示する
(setq ac-menu-height 20)
(set-face-background 'ac-selection-face "lightgray")
(set-face-foreground 'ac-selection-face "red")
(set-face-foreground 'ac-candidate-face "steelblue")
(set-face-background 'ac-selection-face "pink")
;; 曖昧検索を有効にする
(setq ac-fuzzy-cursor-color t)
;; 補完対象に大文字が含まれる場合のみ区別する
(setq ac-ignore-case 'smart)
;; 選択中にTabで補完完了にし、Retで補完中止にするにする
(define-key ac-completing-map "\t" 'ac-complete)
(define-key ac-completing-map "\r" nil)
;(setq ac-dwin t)

;; flymakeの設定
(load "init-flymake")

;; デバッカの設定
(load "init-gdb")

;; 各種言語の設定を行う
(load "init-lang")

;; todo管理にtoodledoを使う
(require 'org-toodledo)

;; Useful key bindings for org-mode
(add-hook 'org-mode-hook
	  (lambda ()
	    (local-unset-key "\C-o")
	    (local-set-key "\C-od" 'org-toodledo-mark-task-deleted)
	    (local-set-key "\C-os" 'org-toodledo-sync)
	    )
	  )
(add-hook 'org-agenda-mode-hook
	  (lambda ()
	    (local-unset-key "\C-o")
	    (local-set-key "\C-od" 'org-toodledo-agenda-mark-task-deleted)
	    )
	  )
