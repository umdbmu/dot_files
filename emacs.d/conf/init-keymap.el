;; C-wでコピー
(global-set-key (kbd "C-w") 'backward-kill-word)
;; C-c wで切取り
(global-set-key (kbd "C-c w") 'kill-region)
;; C-mにnewline-and-indentを割り当てる
(global-set-key (kbd "C-m") 'newline-and-indent)

;;; C-vで切取り
;(global-set-key (kbd "C-v") 'kill-region)
;M-vでコピーpp
;(global-set-key (kbd "M-v") 'kill-ring-save)

;; cua-modeの設定(短形選択を可能にするため)
(cua-mode t)
;; cuaキーバインドを無効にする
(setq cua-enable-cua-keys nil)

;; C-hをバックスペースにする
(global-set-key [(control h)] 'delete-backward-char)

;; コメント、コメントアウトのキーバインドを変更する
(global-set-key (kbd "C-c ;") 'comment-or-uncomment-region)
;; コメントアウトの設定を変更する
;; box, box-multi, multi-line, extra-line, aligned, default が存在する
