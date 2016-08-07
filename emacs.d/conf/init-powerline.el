;; powerline に関する設定
(require 'powerline)

;; 外見設定
(set-face-attribute 'mode-line nil
		    :foreground "#fff"
		    :background "blue"
		    :box nil)
;; 中央
(set-face-attribute 'powerline-active1 nil
		    :foreground "white"
		    :background "black"
		    :inherit 'mode-line)
;; 左右
(set-face-attribute 'powerline-active2 nil
		    :foreground "#000"
		    :background "pink"
		    :inherit 'mode-line)

(defun shorten-directory (dir max-length)
  "Show up to `max-length' characters of a directory name `dir'."
  (let ((path (reverse (split-string (abbreviate-file-name dir) "/")))
	(output ""))
    (when (and path (equal "" (car path)))
      (setq path (cdr path)))
    (while (and path (< (length output) (- max-length 4)))
      (setq output (concat (car path) "/" output))
      (setq path (cdr path)))
    (when path
      (setq output (concat ".../" output)))
    output))

(defun powerline-my-theme ()
  "Setup the my mode-line."
  (interactive)
  (setq-default mode-line-format
   '("%e"
	 (:eval
	  (let* ((active (powerline-selected-window-active))
		 (mode-line (if active 'mode-line 'mode-line-inactive))
		 (face1 (if active 'powerline-active1 'powerline-inactive1))
		 (face2 (if active 'powerline-active2 'powerline-inactive2))
		 (separator-left (intern (format "powerline-%s-%s"
										 powerline-default-separator
										 (car powerline-default-separator-dir))))
		 (separator-right (intern (format "powerline-%s-%s"
										  powerline-default-separator
										  (cdr powerline-default-separator-dir))))
		 (lhs (list (powerline-raw "%*" nil 'l)
					;; (powerline-buffer-size nil 'l)
                    (powerline-raw "%4l/" face1 'l)
					(powerline-raw (number-to-string (count-lines (point-min) (point-max))) face1 'l)
					(powerline-raw ":" face1 'l)
					(powerline-raw "%3c" face1 'r)
					(powerline-raw mode-line-mule-info nil 'l)
					(powerline-raw
					 (shorten-directory default-directory 15)
					 nil 'l)
					(powerline-buffer-id nil 'r)
					(when (and (boundp 'which-func-mode) which-func-mode)
					  (powerline-raw which-func-format nil 'l))
					(powerline-raw " ")
					(funcall separator-left mode-line face1)
					(when (boundp 'erc-modified-channels-object)
					  (powerline-raw erc-modified-channels-object face1 'l))
					(powerline-major-mode face1 'l)
					(powerline-process face1)
					(powerline-minor-modes face1 'l)
					(powerline-narrow face1 'l)
					(powerline-raw " " face1)
					(funcall separator-left face1 face2)
					(powerline-vc face2 'r)))
		 (rhs (list (powerline-raw global-mode-string face2 'r)
					(funcall separator-right face2 face1)
					;; (powerline-raw "%4l/" face1 'l)
					;; (powerline-raw (number-to-string (count-lines (point-min) (point-max))) face1 'l)
					;; (powerline-raw ":" face1 'l)
					;; (powerline-raw "%3c" face1 'r)
					(funcall separator-right face1 mode-line)
					(powerline-raw " ")
					(powerline-raw "%6p" nil 'r)
					(powerline-hud face2 face1))))
		(concat (powerline-render lhs)
				(powerline-fill face2 (powerline-width rhs))
				(powerline-render rhs)))))))

(powerline-my-theme)
