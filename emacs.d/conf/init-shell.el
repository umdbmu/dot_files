;; 使用するshellを決定
(defun skt:shell ()
  (or (executable-find "zsh")
      (executable-find "bash")
      (executable-find "cmdproxy")
      (error "can't find 'shell' command in PATH!")))

;; shell名の設定
(setq shell-file-name (skt:shell))
(setenv "SHELL" shell-file-name)
(setq explicit-shell-file-name shell-file-name)

;; emacsが保持するterminfoを利用する
(setq system-uses-terminfo nil)

;; shell-popを読み込み
(require 'shell-pop)
;; ;; sh,eshell 以外のシェルを使用する
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;; '(ansi-color-names-vector ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 ;; '(custom-enabled-themes (quote (manoj-dark)))
 ;; '(custom-safe-themes (quote ("6cfe5b2f818c7b52723f3e121d1157cf9d95ed8923dbc1b47f392da80ef7495d" default)))
 ;; '(shell-pop-shell-type (quote ("multi-term" "*multi-term*" (lambda nil (multi-term)))))
; '(shell-pop-universal-key "C-c z")
 '(shell-pop-window-height 25)
 '(shell-pop-window-position "bottom")
 ;; '(yas-trigger-key "TAB")
 )
(global-set-key (kbd "C-c z") 'shell-pop)
