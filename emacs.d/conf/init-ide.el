;; ウィンドウを折り返す
(setq truncate-partial-width-windows nil)

(helm-mode t)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x g") 'helm-cmd-t-grep)
(add-to-list 'helm-completing-read-handlers-alist '(find-file . nil))

;; gitフロントエンドを使用する
(require 'magit)
(require 'git-gutter)
(global-set-key (kbd "M-;") 'magit-status)
(global-git-gutter-mode t)
(defadvice magit-status (around magit-fullscreen activate)
  (window-configuration-to-register :magit-fullscreen)
  ad-do-it
  (delete-other-windows))

;; ediff
; コントロール用のバッファを同一フレーム内に表示
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
; diffのバッファを上下ではなく左右に並べる
(setq ediff-split-window-function 'split-window-horizontally)

;; 自動補完
(global-auto-complete-mode t)
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
;; (define-key ac-complete-mode-map (kbd "C-n") 'ac-next)
(setq ac-use-menu-map t)
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)
;; 20行分補完メニューを表示する
(setq ac-menu-height 20)
(set-face-background 'ac-selection-face "lightgray")
(set-face-foreground 'ac-selection-face "white")
(set-face-foreground 'ac-candidate-face "steelblue")
(set-face-background 'ac-selection-face "red")
(set-face-background 'ac-candidate-face "black")
;; 曖昧検索を有効にする
(setq ac-fuzzy-cursor-color t)
;; 補完対象に大文字が含まれる場合のみ区別する
(setq ac-ignore-case 'smart)
;; 選択中にTabで補完完了にし、Retで補完中止にするにする
(define-key ac-completing-map "\t" 'ac-complete)
(define-key ac-completing-map "\r" nil)

;; 拡張版diredを使用する
(defun direx:jump-to-project-directory ()
  (interactive)
  (let ((result (ignore-errors
                  (direx-project:jump-to-project-root-other-window)
                  t)))
    (unless result
      (direx:jump-to-directory-other-window))))
(global-set-key (kbd "C-x C-d") 'direx:jump-to-project-directory)

;; anzu-mode
(global-anzu-mode t)
(global-set-key (kbd "M-%") 'anzu-query-replace)
(global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp)
(set-face-attribute 'anzu-mode-line nil
		    :foreground "yellow" :weight 'bold)
(custom-set-variables
'(anzu-mode-lighter "")
'(anzu-deactivate-region t)
'(anzu-search-threshold 1000)
'(anzu-replace-to-string-separator " => ")
)

;; flycheck
(require 'flycheck)
(require 'flycheck-pos-tip)
;; GUIの警告は表示しない
(setq flymake-gui-warnings-enabled nil)
(setq flycheck-display-errors-function #'flycheck-pos-tip-error-messages)

;; 各種言語の設定を行う
(load "init-lang")
