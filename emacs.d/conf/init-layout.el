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
(add-to-list 'custom-theme-load-path "~/.emacs.d/public_repos/replace-colorthemes")

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

;; �z�F����
;; version24�ȍ~��customize-theme���g��
(if (< emacs-major-version 23)
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
  (custom-set-variables
   '(ansi-color-names-vector ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
   '(custom-enabled-themes (quote (manoj-dark)))
   '(custom-safe-themes (quote ("6cfe5b2f818c7b52723f3e121d1157cf9d95ed8923dbc1b47f392da80ef7495d" default)))
   )
  (add-to-list 'custom-theme-load-path "~/.emacs.d/public_repos/replace-colorthemes"))
