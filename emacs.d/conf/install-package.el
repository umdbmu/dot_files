;; package.elの設定
(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ;; ("melpa-stable" . "https://stable.melpa.org/packages/")
        ("org" . "https://orgmode.org/elpa/")
        ("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)

(package-refresh-contents)
(defvar my/favorite-packages
  '(
    ;; for auto-complete
    auto-complete fuzzy popup pos-tip
		  ;; buffer utils
		  popwin yascroll buffer-move anzu

		  ;; helm
		  helm

		  ;; git
		  magit git-gutter

		  open-junk-file zenburn-theme
		  ))

(dolist (package my/favorite-packages)
  (unless (package-installed-p package)
    (package-install package)))

(defvar installing-package-list
    '(
      ;; 使用しているパッケージ
      auto-async-byte-compile
      sequential-command
      magit
      git-gutter
      helm
      helm-cmd-t
      anzu
      smartparens
      direx
      popwin
      shell-pop
      auto-complete
      zenburn-theme
      powerline
      markdown-mode
      open-junk-file
  )
)
