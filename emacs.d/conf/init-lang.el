 ;;;;;;;;;;;;;;
;; Markdown ;;
 ;;;;;;;;;;;;;;
;; .mkファイルをmarkdown-modeで開く
(setq auto-mode-alist
      (cons '("\\.mk?d$" . markdown-mode) auto-mode-alist))

;;;;;;;;;
;; org ;;
;;;;;;;;;
;; org-modeでソースコードの挿入を綺麗にする
(setq org-src-fontify-natively t)
;; DONEの時刻を記録
(setq org-log-done 'time)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-agenda-files '("~/wiki/tasks"))
;; 見出しの余分な*を消す
(setq org-hide-leading-stars t)
(setq org-default-notes-file (concat "~/wiki/tasks/note.org"))
(define-key global-map "\C-cc" 'org-capture)
(define-key global-map "\C-cl" 'org-store-link)
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/wiki/tasks/inbox.org" "Inbox") "* TODO %?\n %i\n %a")
	("h" "Hirameki" entry (file+headline "~/wiki/tasks/inbox.org" "Hirameki") "* HIRAMEKi %?\n %i\n %a")))
(require 'open-junk-file)
(setq open-junk-file-format "~/wiki/junk/%Y-%m.org")
(global-set-key "\C-xj" 'open-junk-file)

(setq org-agenda-skip-deadline-if-done nil)
(setq org-agenda-skip-scheduled-if-done nil)
(setq org-hierarchical-checkbox-statistics t)
(setq org-log-into-drawer t)

(defun my-org-clocktable-indent-string (level)
  (if (= level 1)
      ""
    (let ((str (format "%d" (- level 1))))
      (while (> level 2)
        (setq level (1- level)
              str (format "%s  " str)))
      (format "%s\\__"str))))

(advice-add 'org-clocktable-indent-string :override #'my-org-clocktable-indent-string)
