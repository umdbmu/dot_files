(require 'flymake)
;; GUIの警告は表示しない
(setq flymake-gui-warnings-enabled nil)
;; 全てのファイルでflymakeを有効化
					;(add-hook 'find-file-hook 'flymake-find-file-hook)
;; M-p/M-nで警告/エラー行の移動
(global-set-key (kbd "M-p") 'flymake-goto-prev-error)
(global-set-key (kbd "M-n") 'flymake-goto-next-error)
;; 警告エラー行の表示
(global-set-key (kbd "C-c d") 'flymake-display-err-menu-for-current-line)
;; gotoした際にエラーメッセージをminibufferに表示する
(defun display-error-message ()
  (message (get-char-property (point) 'help-echo)))
(defadvice flymake-goto-prev-error (after flymake-goto-prev-error-display-message)
  (display-error-message))
(defadvice flymake-goto-next-error (after flymake-goto-next-error-display-message)
  (display-error-message))
(ad-activate 'flymake-goto-prev-error 'flymake-goto-prev-error-display-message)
(ad-activate 'flymake-goto-next-error 'flymake-goto-next-error-display-message)

;;c++のflymakeでmakefileを不要にする
(defun flymake-cc-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
		       'flymake-create-temp-inplace))
	 (local-file  (file-relative-name
		       temp-file
		       (file-name-directory buffer-file-name))))
    (list "g++" (list "-Wall" "-Wextra" "-fsyntax-only" "-fopenmp" local-file))))

(push '("\\.cc$" flymake-cc-init) flymake-allowed-file-name-masks)
(push '("\\.cpp$" flymake-cc-init) flymake-allowed-file-name-masks)
(push '("\\.h$" flymake-cc-init) flymake-allowed-file-name-masks)
(push '("\\.hpp$" flymake-cc-init) flymake-allowed-file-name-masks)
;; ;; popup.elを使ってtipとして表示する
;; (defun my-flymake-display-err-popup.el-for-current-line ()
;;   "Display a menu with errors/warnings for current line if it has errors and/or warnings."
;;   (interactive)
;;   (let* ((line-no (flymake-current-line-no))
;; 	 (line-err-info-list (nth 0 (flymake-find-err-info flymake-err-info line-no)))
;; 	 (menu-data (flymake-make-err-menu-data line-no line-err-info-list)))
;;     (if menu-data
;;        (popup-tip (mapconcat '(lambda (e) (nth 0 e)) (nth 1 menu-data)
;; 			     "\n")))
;;     )
;;   )
;; (set-face-background 'flymake-errline "red")
;; (set-face-background 'flymake-warnline "yellow")
