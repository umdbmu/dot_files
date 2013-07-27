;; タグジャンプを使用可能にする
(require 'gtags nil t)
(setq gtags-suggested-key-mapping t)
;; 関数の定義元へ移動
(global-set-key (kbd "C-c t") 'gtags-find-tag)
;;関数の参照元へ移動
(global-set-key (kbd "C-c r") 'gtags-find-rtag)
;; タグで解析されているファイルへ移動
(global-set-key (kbd "C-c p") 'gtags-find-file)
;; 変数の参照元と定義元へ移動
(global-set-key (kbd "C-c s") 'gtags-find-symbol)
;;移動前の場所へ戻る
(global-set-key (kbd "C-c a") 'gtags-pop-stack)
;; (add-hook 'c-mode-common-hook
;; 	  '(lambda ()
;; 	     (gtags-mode 1)
;; 	     (gtags-make-complete-list)
;; 	     ))

;; プロジェクト管理する
(require 'eproject)
(push '(eproject) popwin:special-display-config)

;; gitフロントエンドを使用する
(require 'magit)

;; 自動補完
 (require 'auto-complete)
(global-auto-complete-mode t)
;; (define-key ac-complete-mode-map (kbd "C-n") 'ac-next)
;; (define-key ac-complete-mode-map (kbd "C-p") 'ac-previous)

;; flymakeの設定
(load "init-flymake")

;; 各種言語の設定を行う
(load "init-lang")
