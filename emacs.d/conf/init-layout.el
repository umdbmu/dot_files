;;; �����ڂɊւ���ݒ�

;; �t�H���g��ύX����
(set-face-attribute 'default nil
		    :family "Ricty"
		    :height 110)

;; ��ʉ��Ɍ��݂̊֐�����\������
(which-function-mode 1)

(if (fboundp 'set-scroll-bar-mode) (set-scroll-bar-mode nil))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
;; �Ή����銇�ʂ̃n�C���C�g
(setq show-paren-mode-delay 0)
(show-paren-mode t)
;; paren�̃X�^�C��
(setq show-paren-style 'expression)
(set-face-background 'show-paren-match-face "NavyBlue")

;(setq hi-line-face '((:background "NavyBlue" t)(t(:bold t))))
(global-hl-line-mode t)

;; �z�F����
;; version23�ȑO�͓Ǝ��Ŕz�F���w�肷��
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
  (add-to-list 'custom-theme-load-path "~/.emacs.d/public_repos/replace-colorthemes"))
