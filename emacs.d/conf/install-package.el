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
      auto-async-byte-compile
      ;; git-rebase-mode
      ;; git-commit-mode
      magit
      git-gutter
      helm
      helm-cmd-t
      helm-bm
      anzu
      undo-tree
      smartparens
      smart-compile
      ;; gtags
      helm-gtags
      helm-cmd-t
      direx
      multi-term
      lib-requires
      popwin
      shell-pop
      go-mode
      go-autocomplete
      auto-complete
      gtags
      helm-gtags
      flycheck
      flycheck-pos-tip
      ;; flymake
      ;; flymake-go
      ;; helm-flymake
      ;; processing-mode
      js2-mode
      js2-refactor
      zenburn-theme
      ;; hc-zenburn
      ;; tabbar
      powerline
      rainbow-delimiters
      web-mode
      ))

(let ((not-installed (loop for x in installing-package-list
			   when (not (package-installed-p x))
			   collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
      (package-install pkg))))
