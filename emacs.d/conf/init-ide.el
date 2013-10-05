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
;; (define-key ac-complete-mode-map (kbd "C-n") 'ac-next)
;; (define-key ac-complete-mode-map (kbd "C-p") 'ac-previous)

;; flymakeの設定
(load "init-flymake")

;; デバッカの設定
(load "init-gdb")

;; 各種言語の設定を行う
(load "init-lang")
