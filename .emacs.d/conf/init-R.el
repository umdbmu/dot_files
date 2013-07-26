(defface R-face '((t)) nil)
(defvar R-face 'R-face)
(set-face-attribute 'R-face nil
		    :family "MarkDown"
		    :height 120
		    )

(add-hook 'R-mode-hook
	  '(lambda ()
	     (buffer-face-set 'R-face)))

;; ESSの設定
;(require 'ess-site)
;; R起動時にワーキングディレクトリをたずねない
;(setq ess-ask-for-ess-directory nil)

;; auto-installを読み込む
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (when (require 'auto-install nil t)		       ;;
;;   ;; インストールディレクトリを指定する	       ;;
;;   (setq auto-install-directory "~/.emacs.d/elisp")  ;;
;;   ;; EmacsWikiに登録されているelispの名前を取得する ;;
;;   (auto-install-update-emacswiki-package-name t)    ;;
;;   ;; install-elispの関数を利用可能にする	       ;;
;;   (auto-install-compatibility-setup))	       ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
