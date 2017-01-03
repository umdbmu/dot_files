;;;;;;;
;; c ;;
;;;;;;;
;; (load "init-cc")

 ;;;;;;;;;;;;;;
;; Markdown ;;
 ;;;;;;;;;;;;;;
;; .mkファイルをmarkdown-modeで開く
(setq auto-mode-alist
      (cons '("\\.mk?d$" . markdown-mode) auto-mode-alist))
;; (add-hook 'markdown-mode-hook 'flyspell-mode)
;; Marked でmarkdownファイルをプレビューする (Mac OSX時)

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
	("h" "Hirameki" entry (file+headline "~/wiki/tasks/inbox.org" "Hirameki") "* HIRAMEKi %?\n %i\n %a")
	("b" "Bookmark" entry (file+headline "~/wiki/tasks/inbox.org" "Bookmark") "* Bookmark %?\n %i\n %a")))
(require 'open-junk-file)
(setq open-junk-file-format "~/wiki/junk/%Y-%m-%d-daily.org")
(global-set-key "\C-xj" 'open-junk-file)

(setq org-agenda-skip-deadline-if-done t)
(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-skip-scheduled-if-deadline-is-shown t)
(setq org-hierarchical-checkbox-statistics t)
(setq org-log-into-drawer t)

(setq org-agenda-custom-commands
      '(("c" "Calendar" agenda ""
         ((org-agenda-ndays 7)                          ;; [1]
          (org-agenda-start-on-weekday 0)               ;; [2]
          (org-agenda-time-grid nil)
          (org-agenda-repeating-timestamp-show-all t)   ;; [3]
          (org-agenda-entry-types '(:timestamp :sexp))))  ;; [4]
      ;; other commands go here
        ))

(defun my-org-clocktable-indent-string (level)
  (if (= level 1)
      ""
    (let ((str "-")) ;first char, e.g can be "|"
      (while (> level 2)
        (setq level (1- level)
              str (concat str "-"))) ;fillers, e.g can be "---"
      (concat str " ")))) ;end e.g can be ">"

(advice-add 'org-clocktable-indent-string :override #'my-org-clocktable-indent-string)
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

(setq org-confirm-babel-evaluate nil)
(advice-add 'org-clocktable-indent-string :override #'my-org-clocktable-indent-string)
;(load "init-plantuml")

(add-to-list 'org-agenda-custom-commands
             '("D" agenda ""
               ( ;; 1日分だけ表示する
                (org-agenda-span 1)
                ;; agenda各行の行頭のスペースをなくす
                (org-agenda-prefix-format '((agenda . "%?-12t% s")))
                ;; グリッドを表示しない
                (org-agenda-use-time-grid nil)
                ;; clockを表示する
                (org-agenda-start-with-log-mode t)
                (org-agenda-show-log 'clockcheck)
                ;; clockの総計を表でまとめる
                (org-agenda-start-with-clockreport-mode t)
                (org-agenda-clockreport-mode t))))
(advice-add 'org-clocktable-indent-string :override #'my-org-clocktable-indent-string)

;;;;;;;;;;;;;;;;
;; emacs lisp ;;
;;;;;;;;;;;;;;;;
;; smart-compileを読み込む
;; (require 'smart-compile)
;; (autoload 'smart-compile "smart-compile" "when compiling")
;; (global-set-key (kbd "C-c c") 'smart-compile)

;; elファイル保存時にauto-async-byte-compileを実行する
(require 'auto-async-byte-compile)
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)
