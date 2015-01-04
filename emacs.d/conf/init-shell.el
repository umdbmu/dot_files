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
(setq shell-pop-window-height 50)
(setq shell-pop-window-position "bottom")
(global-set-key (kbd "C-c z") 'shell-pop)
