;; ;;SKKを追加する
;; (require 'skk-autoloads)
;; (global-set-key (kbd "M-j") 'skk-mode)
;; (global-set-key "\C-cj" 'skk-auto-fill-mode)
;; ;(global-set-key "\C-xt" 'skk-tutorial)
;; (setq skk-preload t)
;; ;; DDSKKのディレクトリを変更する
;; (setq skk-user-directory "~/.emacs.d/elisp/.ddskk")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;ローマ字のまま日本語をインクリメンタルサーチする	   ;;
;; (setq migemo-command "cmigemo")			   ;;
;; (setq migemo-options '("-q" "--emacs" "-i" "\g"))	   ;;
;; ;; migemo-dictのパスを指定				   ;;
;; (setq migemo-directory "~/.emacs.d/share/dict/utf-8.d") ;;
;; (setq migemo-user-dictionary nil)			   ;;
;; (setq migemo-regex-dictionary nil)			   ;;
;; ;; キャッシュ機能を利用する				   ;;
;; (setq migemo-use-pattern-alist t)			   ;;
;; (setq migemo-use-frequent-pattern-alist t)		   ;;
;; (setq migemo-pattern-alist-length 1024)		   ;;
;; ;; 辞書の文字コードを指定				   ;;
;; (setq migemo-coding-system 'utf-8)			   ;;
;; 							   ;;
;; (load-library "migemo")				   ;;
;; ;; 起動時に初期化も行う				   ;;
;; (migemo-init)					   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; yasnippetの設定をする
(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/.emacs.d/share/mysnippets"))
(yas-global-mode 1)
;; 単語展開キーバインド
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(custom-enabled-themes (quote (manoj-dark)))
 '(custom-safe-themes (quote ("6cfe5b2f818c7b52723f3e121d1157cf9d95ed8923dbc1b47f392da80ef7495d" default)))
 '(yas-trigger-key "TAB"))
;; 既存スニペットを挿入する
(define-key yas-minor-mode-map (kbd "C-c i l") 'yas-insert-snippet)
;; 新規スニペットを作成するバッファを用意する
(define-key yas-minor-mode-map (kbd "C-c i n") 'yas-new-snippet)
;; 既存スニペットを閲覧・編集す
(define-key yas-minor-mode-map (kbd "C-c i v") 'yas-visit-snippet-file)
;(yas/global-mode 1)
;(yas/initialize)
;(setq yas/root-directory '(~/.emacs.d/share/mysnippets))
;(require 'anything-c-yasnippet)
;(setq anything-c-yas-space-match-any-greedy t)
;(setq yas/use-menu nil)
;; トリガはSPC、次の候補への移動はTAB
;(setq yas/trigger-key (kbd "SPC"))
;(setq yas/next-field-key (kbd "TAB"))
;(global-set-key (kbd "C-c y") 'anything-c-yas-complete)
;(yas/initialize)
;(yas/load-directory-1 "<path>/<to>/snippets/")
