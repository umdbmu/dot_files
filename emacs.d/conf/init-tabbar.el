;; �^�u��Ń}�E�X�z�C�[�����얳��
(tabbar-mwheel-mode -1)
(mouse-wheel-mode -1)

(tabbar-mode 1)

;; �O���[�v�����Ȃ�
(setq tabbar-buffer-groups-function nil)

;; ���ɕ\�������{�^���𖳌���
(dolist (btn '(tabbar-buffer-home-button
               tabbar-scroll-left-button
               tabbar-scroll-right-button))
  (set btn (cons (cons "" nil)
                 (cons "" nil))))

;; �^�u�̒���
(setq tabbar-separator '(0.8))

;; �O�ϕύX
(set-face-attribute
 'tabbar-default nil
 :background "brightblack"
 ;; :foreground "red"
 :height 1.0)
(set-face-attribute
 'tabbar-unselected nil
 :background "brightblack"
 :foreground "magenta"
 :height 0.6
 :box nil)
(set-face-attribute
 'tabbar-selected nil
 :background "brightblue"
 :foreground "white"
 :box t)
;; (set-face-attribute
;;  'tabbar-button nil
;;  :box nil)
(set-face-attribute
 'tabbar-separator nil
 :height 1.3)

;;�^�u�؂�ւ��̃L�[�o�C���h
(global-set-key "\M-]" 'tabbar-forward)
(global-set-key "\M-[" 'tabbar-backward)

