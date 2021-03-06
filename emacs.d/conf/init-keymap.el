;; C-wでコピー
(global-set-key [(control w)] 'backward-kill-word)
;; C-c wで切取り
(global-set-key (kbd "C-c w") 'kill-region)
;; C-mにnewline-and-indentを割り当てる
(global-set-key (kbd "C-m") 'newline-and-indent)

;; C-hをバックスペースにする
(global-set-key [(control h)] 'delete-backward-char)

;; コメント、コメントアウトのキーバインドを変更する
(global-set-key (kbd "C-c ;") 'comment-or-uncomment-region)
;; コメントアウトの設定を変更する
;; box, box-multi, multi-line, extra-line, aligned, default が存在する

;; C-kで行全体を削除
(setq kill-whole-line t)
