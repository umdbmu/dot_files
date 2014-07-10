;;go mode
(require 'go-mode-load)
(require 'go-autocomplete)
(require 'auto-complete-config)
(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook
	  '(lambda ()
	     (local-set-key (kbd "M-.") 'godef-jump)
	     (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)
	     (local-set-key (kbd "C-c i") 'go-goto-imports)
	     (local-set-key (kbd "C-c d") 'godoc)
	     (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)))
