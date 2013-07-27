;;go mode
(require 'go-mode-load)
(require 'go-autocomplete)
(require 'auto-complete-config)
(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook (lambda ()
			  (local-set-key (kbd "M-.") 'godef-jump)))
