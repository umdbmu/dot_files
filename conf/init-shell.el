;; shell-popを読み込み
(require 'shell-pop)
;; sh,eshell 以外のシェルを使用する
(add-to-list 'shell-pop-internal-mode-list '("multi-term" "*terminal<1>*" '(lambda () (multi-term))))
(shell-pop-set-internal-mode "multi-term")
;; 出現位置の設定
(shell-pop-set-window-height 25)
(shell-pop-set-internal-mode-shell shell-file-name)
;; shell-popの割り当て
(global-set-key (kbd "C-c z") 'shell-pop)

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
