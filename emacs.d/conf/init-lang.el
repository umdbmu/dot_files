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
(custom-set-faces
 '(markdown-header-face-1 ((t (:inherit org-level-1))))
 '(markdown-header-face-2 ((t (:inherit org-level-2))))
 '(markdown-header-face-3 ((t (:inherit org-level-3))))
 '(markdown-header-face-4 ((t (:inherit org-level-4))))
 '(markdown-header-face-5 ((t (:inherit org-level-5))))
 '(markdown-header-face-6 ((t (:inherit org-level-6))))
)
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

;(require 'org-icalendar)
;(define-key org-mode-map (kbd "C-c 1") 'my-org-export-icalendar)
;(setq org-icalendar-combined-description "OrgModeのスケジュール出力")
;(setq org-icalendar-timezone nil)
;; DONE になった TODO は出力対象から除外する
;(setq org-icalendar-include-todo t)
;; （通常は，<>--<> で区間付き予定をつくる．非改行入力で日付がNoteに入らない）
;(setq org-icalendar-use-scheduled '(event-if-todo))
;; DL 付きで終日予定にする：締め切り日（スタンプで時間を指定しないこと）
;(setq org-icalendar-use-deadline '(event-if-todo))

(defvar growl-program "growlnotify")
(defvar growl-notify-icon (concat data-directory "images/icons/hicolor/128x128/apps/emacs.png"))
(defvar growl-notify-application-name "Emacs")
(defun growl-notify (title message priority)
  (interactive)
  (call-process growl-program nil 0 nil
                "/r:\"General Notification\""
                (concat "/pass:" (shell-quote-argument "password"))
                (concat "/a:" (shell-quote-argument growl-notify-application-name))
                (concat "/ai:" (shell-quote-argument growl-notify-icon))
                (concat "/p:" priority)
                (concat "/t:" (shell-quote-argument
                               (encode-coding-string title 'shift_jis)))
                (encode-coding-string message 'shift_jis)))

(add-hook 'org-clock-in-hook
          (lambda ()
            (growl-notify org-clock-heading
              (concat "[start] " (format-time-string "%D %T" org-clock-start-time))
              "0")))

(add-hook 'org-clock-out-hook
          (lambda ()
            (growl-notify org-clock-heading
              (concat "[end] " (format-time-string "%D %T" org-clock-start-time))
              "2")))

(setq org-capture-templates
      '(
        ("i" "interrupted task" entry
         (file "~/wiki/tasks/interrupt.org")
         "* %?\n" :clock-in t :clock-resume t)
       ))
;;;;;;;;;;;;;;;;
;; emacs lisp ;;
;;;;;;;;;;;;;;;;
;; smart-compileを読み込む
;; (require 'smart-compile)
;; (autoload 'smart-compile "smart-compile" "when compiling")
;; (global-set-key (kbd "C-c c") 'smart-compile)

;; elファイル保存時にauto-async-byte-compileを実行する
;; (require 'auto-async-byte-compile)
;; (add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)
