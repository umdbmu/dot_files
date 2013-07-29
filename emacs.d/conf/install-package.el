;; package.elの設定
(when (require 'package nil t)
  ;; パッケージリポジトリにMarmaladeqと開発者運営のELPAを追加
  (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
;  (add-to-list 'package-archives '("ELPA" . "http://tromey.com/elpa/"))
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
  ;; インストールしたパッケージにロードパスを通して読み込む
  (package-initialize))

(require 'cl)

(defvar installing-package-list
    '(
      ;; 使用しているパッケージ
      auto-async-byte-compile
      magit
      gist
      helm-gist
      helm-ls-git
      anything
      undo-tree
      undohist
      flex-autopair
      smart-compile
      yasnippet
      gtags
      helm-gtags
      direx
      window-layout
      e2wm
      e2wm-bookmark
      multi-term
      lib-requires
      eproject
      popwin
      shell-pop
      go-mode
      auto-complete
      flymake
      flymake-go
      helm-flymake
      twittering-mode
      ))

(let ((not-installed (loop for x in installing-package-list
			   when (not (package-installed-p x))
			   collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
      (package-install pkg))))
