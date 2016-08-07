;; package.elの設定
(when (require 'package nil t)
  ;; パッケージリポジトリにMarmaladeqと開発者運営のELPAを追加
  ;;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
;  (add-to-list 'package-archives '("ELPA" . "http://tromey.com/elpa/"))
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
  ;; インストールしたパッケージにロードパスを通して読み込む
  (package-initialize))

(require 'cl)

(defvar installing-package-list
    '(
      ;; 使用しているパッケージ
      sequential-command
      magit
      git-gutter
      helm
      helm-cmd-t
      anzu
      undo-tree
      smartparens
      direx
      lib-requires
      popwin
      shell-pop
      auto-complete
      zenburn-theme
      powerline
      markdown-mode
      open-junk-file
  ))

(let ((not-installed (loop for x in installing-package-list
			   when (not (package-installed-p x))
			   collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
      (package-install pkg))))
