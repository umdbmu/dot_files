;;; �����ڂɊւ���ݒ�
;; �t�H���g��ύX����
(set-face-attribute 'default nil
		    :family "Ricty"
		    :height 110)

(if (fboundp 'set-scroll-bar-mode) (set-scroll-bar-mode nil))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

(load-theme 'misterioso t)
(custom-set-faces
'(hl-line ((t (:background "color-236")))))

;; �Ή����銇�ʂ̃n�C���C�g
(setq show-paren-mode-delay 0)
(show-paren-mode t)
;; paren�̃X�^�C��
(setq show-paren-style 'expression)
(set-face-background 'show-paren-match-face "NavyBlue")

;(setq hi-line-face '((:background "NavyBlue" t)(t(:bold t))))
(global-hl-line-mode t)

(require 'whitespace)
(setq whitespace-style '(face           ; face�ŉ���
			 trailing       ; �s��
			 tabs           ; �^�u
			 spaces         ; �X�y�[�X
			 empty          ; �擪/�����̋�s
			 space-mark     ; �\���̃}�b�s���O
			 tab-mark
			 ))

(setq whitespace-display-mappings
      '((space-mark ?\u3000 [?\u25a1])
	;; WARNING: the mapping below has a problem.
	;; When a TAB occupies exactly one column, it will display the
	;; character ?\xBB at that column followed by a TAB which goes to
	;; the next TAB column.
	;; If this is a problem for you, please, comment the line below.
	(tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))

;; �X�y�[�X�͑S�p�݂̂�����
(setq whitespace-space-regexp "\\(\u3000+\\)")
;; �ۑ��O�Ɏ����ŃN���[���A�b�v
(setq whitespace-action '(auto-cleanup))
(global-whitespace-mode 1)

(defvar my/bg-color "#232323")
(set-face-attribute 'whitespace-trailing nil
		    :background my/bg-color
		    :foreground "DeepPink"
		    :underline t)
(set-face-attribute 'whitespace-tab nil
		    :background my/bg-color
		    :foreground "LightSkyBlue"
		    :underline t)
(set-face-attribute 'whitespace-space nil
		    :background my/bg-color
		    :foreground "GreenYellow"
		    :weight 'bold)
(set-face-attribute 'whitespace-empty nil
		    :background my/bg-color)

;;; mode-line�̃��C�A�E�g
;; ��ʉ��Ɍ��݂̊֐�����\������
(which-function-mode 1)

;; powerline�𗘗p����
(load "init-powerline")

;;; mode�̖��O�������ōĒ�`
(defvar mode-line-cleaner-alist
  '(
    ;; mode-line�ɕ\�����镶����
    ;; minor-mode
    (flymake-mode . " Fm")
    (undo-tree-mode . "")
    (git-gutter-mode . "")
    (helm-mode . "")
    (anzu-mode . "")
    (magit-auto-revert-mode . " Re")
    (abbrev-mode . "")

    ;; major-mode
    (fundamental-mode . "Fund")
    (dired-mode . "Dir")
    (lisp-interaction-mode . "Li")
    (cperl-mode . "Pl")
    (python-mode . "Py")
    (php-mode . "Ph")
    (ruby-mode   . "Rb")
    (emacs-lisp-mode . "El")
    (markdown-mode . "Md")))

(defun clean-mode-line ()
  (interactive)
  (loop for (mode . mode-str) in mode-line-cleaner-alist
	do
	(let ((old-mode-str (cdr (assq mode minor-mode-alist))))
	  (when old-mode-str
	    (setcar old-mode-str mode-str))
	  ;; major mode
	  (when (eq mode major-mode)
	    (setq mode-name mode-str)))))

(add-hook 'after-change-major-mode-hook 'clean-mode-line)
