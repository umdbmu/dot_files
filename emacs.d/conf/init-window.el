;;; �����ڂɊւ���ݒ�

;; �t�H���g��ύX����
(set-face-attribute 'default nil
		    :family "Ricty"
		    :height 110)

;; �s�ƌ�����ʉ��ɕ\��
(if (fboundp 'line-number-mode) (line-number-mode t))
(column-number-mode t)
;; �I��͈͂̕���������ʉ��ɕ\��
(defun count-lines-and-chars ()
  (if mark-active
      (format "[%3d:%4d]"
	      (count-lines (region-beginning) (region-end))
	      (- (region-end) (region-beginning)))
    ""))
(add-to-list 'mode-line-format
	     '(:eval (count-lines-and-chars)))

;; ��ʉ��Ɏ�����\��
(display-time)
(setq appt-display-duration 60)

;; ��ʉ��Ɍ��݂̊֐�����\������
(which-function-mode 1)

;; tabbar�̐ݒ������
; (load "init-tabbar")

(if (fboundp 'set-scroll-bar-mode) (set-scroll-bar-mode nil))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
;; �Ή����銇�ʂ̃n�C���C�g
(setq show-paren-mode-delay 0)
(show-paren-mode t)
;; paren�̃X�^�C��
(setq show-paren-style 'expression)
(setq hl-line-face 'my-hl-line-face)
(global-hl-line-mode t)

;; popwin�̐ݒ�
(require 'popwin)
;(setq display-buffer-alist 'popwin:display-buffer)
(push '("*Buffer List*" :position left :width 50) popwin:special-display-config)
(push '("*dvi-preview") popwin:special-display-config)
(push '(":home" :position left :width 50) popwin:special-display-config)
(push '("*YaTeX-typesetting*" :position left :width 50) popwin:special-display-config)
;(push '("*shell*") popwin:special-display-config)

;; (require 'e2wm-vcs)
;; (e2wm:add-keymap
;;  e2wm:pst-minor-mode-keymap
;;  '(("<M-left>". e2wm:dp-code)		;code-mode
;;    ("<M-right>". e2wm:dp-two)		;two-mode
;;    ("<M-up>". e2wm:dp-doc)		;doc-mode
;;    ("<M-down>".e2wm:dp-dashboard)	;dashboard-mode
;;    ("<M-*>". e2wm:dp-magit)
;;    ) e2wm:prefix-key)
;; (require 'e2wm)

; (global-set-key (kbd "M-+") 'e2wm:start-management)
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(magit-git-executable "C:/Program Files (x86)/Git/bin/git.exe"))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )

;; �z�F����
;; version24�ȍ~��customize-theme���g��
(if (< emacs-major-version 24)
    (
     ;; �����̐F��ݒ�
     (set-foreground-color "black")
     ;; �w�i�F��ݒ�
     (set-background-color "misty rose")
     ;; �~�j�o�b�t�@�̐F��ύX
     (set-face-foreground 'minibuffer-prompt "goldenrod")
     (set-face-foreground 'font-lock-function-name-face "white")
     (set-face-foreground 'font-lock-preprocessor-face "tomato")
     (set-face-foreground 'font-lock-string-face "gold")
     (set-face-foreground 'font-lock-builtin-face "violetred")
     ;; �A�N�e�B�u�łȂ��o�b�t�@�̔w�i�F��ύX
     (set-face-background 'mode-line-inactive "turquoise4")
     ;; �A�N�e�B�u�łȂ��o�b�t�@�̕����F��ύX
     (set-face-foreground 'mode-line-inactive "turquoise3")
     ;; �A�N�e�B�u�̃o�b�t�@�̔w�i�F��ύX
     (set-face-background 'mode-line "dark")
     ;; �A�N�e�B�u�̃o�b�t�@�̕����F��ύX
     (set-face-foreground 'mode-line "white")
     (set-face-foreground 'font-lock-comment-face "HotPink")
     (set-face-foreground 'font-lock-comment-delimiter-face "HotPink")
     (set-face-foreground 'font-lock-variable-name-face "firebrick4")
     ;; ���e�̃o�[�̕����F
     (set-face-foreground 'fringe "NavajoWhite4")
     ;; ���e�̃o�[�̔w�i�F
     (set-face-background 'fringe "NavajoWhite4"))
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   ))
