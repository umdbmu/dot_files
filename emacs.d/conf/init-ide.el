;; タグジャンプを使用可能にする
(require 'gtags)
(require 'helm-gtags)
(setq gtags-suggested-key-mapping t)
;; 関数の定義元へ移動
(global-set-key (kbd "C-c t") 'helm-gtags-find-tag)
;;関数の参照元へ移動
(global-set-key (kbd "C-c r") 'helm-gtags-find-rtag)
;; タグで解析されているファイルへ移動
(global-set-key (kbd "C-c p") 'helm-gtags-find-file)
;; 変数の参照元と定義元へ移動
(global-set-key (kbd "C-c s") 'helm-gtags-find-symbol)
;; 現在のソースコード内で定義されている関数の一覧
(global-set-key (kbd "C-c l") 'helm-gtags-parse-file)
;;移動前の場所へ戻る
(global-set-key (kbd "C-c a") 'helm-gtags-pop-stack)
;; GTAGSを自動更新する
(defun update-gtags (&optional prefix)
  (interactive "P")
  (let ((rootdir (gtags-get-rootpath))
	(args (if prefix "-v" "-iv")))
    (when rootdir
      (let* ((default-directory rootdir)
	     (buffer (get-buffer-create "*update GTAGS*")))
	(save-excursion
	  (set-buffer buffer)
	  (erase-buffer)
	  (let ((result (process-file "gtags" nil buffer nil args)))
	    (if (= 0 result)
		(message "GTAGS successfully updated.")
	      (message "update GTAGS error with exit status %d" result))))))))
(add-hook 'after-save-hook 'update-gtags)
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
(require 'helm-ls-git)
(require 'helm-gist)

(global-set-key (kbd "C-x C-g") 'helm-ls-git-ls)

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
