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
      git-gutter
      magit
      helm
      ;; gist
      ;; helm-gist
      ;; helm-ls-git
      ;; anything
      anzu
      undo-tree
      bookmark+
      ;; undohist
      smartparens
      ;; org-toodledo
      smart-compile
      ;; http-post-simple
      ;; yasnippet
      ;; gtags
      ;; helm-gtags
      direx
      ;; window-layout
      ;; e2wm
      ;; e2wm-bookmark
      multi-term
      lib-requires
      ;; eproject
      popwin
      shell-pop
      go-mode
      go-autocomplete
      auto-complete
      ;; flymake
      ;; flymake-go
      ;; helm-flymake
      ;; processing-mode
      js2-mode
      js2-refactor
      zenburn-theme
      ;; tabbar
      powerline
      rainbow-delimiters
      web-mode
      ;; http-post-simple
      ;; org-toodledo
      ))

(let ((not-installed (loop for x in installing-package-list
			   when (not (package-installed-p x))
			   collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
      (package-install pkg))))
