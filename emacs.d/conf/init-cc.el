;;c++のflymakeでmakefileを不要にする
(defun flymake-c++-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
		       'flymake-create-temp-inplace))
	 (local-file  (file-relative-name
		       temp-file
		       (file-name-directory buffer-file-name))))
    (setq compiler
    (or (executable-find "mpic++")
	(executable-find "g++")
	(warn "can't find g++ compiler in PATH")))
    (list compiler (list "-Wall" "-fopenmp" "-fsyntax-only" local-file))
;    (list "g++" (list "-Wall" "-Wextra" "-fsyntax-only" "-fopenmp" local-file))
    ))

(defun flymake-c-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
		       'flymake-create-temp-inplace))
	 (local-file  (file-relative-name
		       temp-file
		       (file-name-directory buffer-file-name))))
    (list "mpicc" (list "-Wall" "-fopenmp" "-fsyntax-only" local-file))
;    (list "g++" (list "-Wall" "-Wextra" "-fsyntax-only" "-fopenmp" local-file))
    ))

(push '("\\.cpp$" flymake-c++-init) flymake-allowed-file-name-masks)
(push '("\\.hpp$" flymake-c++-init) flymake-allowed-file-name-masks)
(push '("\\.c$" flymake-c++-init) flymake-allowed-file-name-masks)
(push '("\\.h$" flymake-c++-init) flymake-allowed-file-name-masks)
