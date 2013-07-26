;;; perlの設定いろいろ
;; cperl-modeで開く
(defalias 'perl-mode 'cperl-mode)

;; フォントの変更
(defface perl-face '((t)) nil)
(defvar perl-face 'perl-face)
(set-face-attribute 'perl-face nil			 ;;
		    :family "Eureka"			 ;;
		    :background "DarkViolet"
		    :height 180)
;(font-set-font nill 'perl-face (font-spec :family "Eureka" size 17))
(add-hook 'cperl-mode-hook			     ;;
	  '(lambda()				     ;;
	     (buffer-face-set 'perl-face)	     ;;
	     (setq comment-style 'aligned)	     ;;
	     ))

;; 選択したリージョンを一気に整形してくれる
(defun perltidy-region()
  "Run pertidy on the current region."
  (interactive)p
  (save-excursion
    (shell-command-on-region (point) (mark) "perltidy -q" nil t)))

(defun perltidy-defun()
  "Run perltidy on the current defun."
  (interactive)
  (save-excursion (mark-defun)
		  (perltidy-region)))
;; flymakeとか色々
;; set-perl5lib
;; 開いたスクリプトのパスに応じて@INFにlibを追加してくれる
;; 使いつづけると汚れるとかなんとか
(require 'set-perl5lib)

;; perl用設定
(defun flymake-perl-init()
  (let* ((temp-file (flymake-init-create-tmep-buffer-copy
		     'flymake-create-temp-inplace))
	 (local-file (file-relative-name
		      temp-file
		      (file-name-directory buffer-line-name))))
    (list "perl" (list "-wc" local-file))))
;(add-hook 'cperl-mode-hook 'flymake-mode)

;; perl-completionについて
(defun ac-perl()
  (setq plcmp-use-keymap nil)
  (require 'perl-completion)
  (add-to-list 'ac-sources 'ac-sourceps-perl-completion)
  (perl-completion-mode t)
  ;; plcmp-mode-mapにコマンドを割当る
  (define-key plcmp-mode-map (kbd "C-c m") 'plcmp-cmd-menu)
  (define-key plcmp-mode-map (kbd "C-c s") 'plcmp-cmd-smart-complete)
  (define-key plcmp-mode-map (kbd "C-c d") 'plcmp-cmd-show-doc)
  (define-key plcmp-mode-map (kbd "C-c p") 'plcmp-cmd-show-doc-at-point)
  (define-key plcmp-mode-map (kbd "C-c c") 'plcmp-cmd-clear-all-cashes))

(add-hook 'cperl-mode-hook 'ac-perl)