;; タブ上でマウスホイール操作無効
(tabbar-mwheel-mode -1)
(mouse-wheel-mode -1)

(tabbar-mode t)

;; 同じフォルダ上にあるバッファのみタブに表示する
(setq tabbar-cycle-scope 'tabs)
(setq tabbar-buffer-groups-function
      (lambda ()
	(let ((dir (expand-file-name default-directory)))
	  (cond ((member (buffer-name) '("*Completions*"
					 "*scratch*"
					 "*Messages*"
					 "*Ediff Registry*"))
		 (list "#misc"))
		((string-match-p "/.emacs.d/" dir)
		 (list ".emacs.d"))
		(t (list dir))))))

;; グループ化しない
(setq tabbar-buffer-groups-function nil)

;; 左に表示されるボタンを無効化
(dolist (btn '(tabbar-buffer-home-button
               tabbar-scroll-left-button
               tabbar-scroll-right-button))
  (set btn (cons (cons "" nil)
                 (cons "" nil))))

;; タブの長さ
(setq tabbar-separator '(0.8))

;; 外観変更
(set-face-attribute
 'tabbar-default nil
 :background "brightblack"
 ;; :foreground "red"
 :height 1.0)
(set-face-attribute
 'tabbar-unselected nil
 :background "brightblack"
 :foreground "white"
 :height 0.6
 :box nil)
(set-face-attribute
 'tabbar-selected nil
 :background "color-203"
 :foreground "#fff"
 :box t)
;; (set-face-attribute
;;  'tabbar-button nil
;;  :box nil)
(set-face-attribute
 'tabbar-separator nil
 :height 1.3)

;;タブ切り替えのキーバインド
(global-set-key "\M-]" 'tabbar-forward)
(global-set-key "\M-[" 'tabbar-backward)

