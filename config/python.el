(elpy-enable)

(elpy-use-ipython)
;;pdb setup, note the python version
(setq pdb-path '/usr/lib/python3.6/pdb.py
      gud-pdb-command-name (symbol-name pdb-path))
(defadvice pdb (before gud-query-cmdline activate)
  "Provide a better default command line when called interactively."
  (interactive
   (list (gud-query-cmdline pdb-path
			    (file-name-nondirectory buffer-file-name)))))
