(elpy-enable)

;Rewrite elpy-goto-location without recenter
(defun elpy-goto-location (filename offset &optional other-window-p)
  "Show FILENAME at OFFSET to the user.

If other-window-p is non-nil, show the same in other window."
  (ring-insert find-tag-marker-ring (point-marker))
  (let ((buffer (find-file-noselect filename)))
    (if other-window-p
        (pop-to-buffer buffer t)
      (switch-to-buffer buffer))
    (goto-char (1+ offset))
    ))


;;pdb setup, note the python version
(setq pdb-path '/usr/lib/python3.6/pdb.py
      gud-pdb-command-name (symbol-name pdb-path))
(defadvice pdb (before gud-query-cmdline activate)
  "Provide a better default command line when called interactively."
  (interactive
   (list (gud-query-cmdline pdb-path
			    (file-name-nondirectory buffer-file-name)))))

(add-hook 'python-mode-hook 'guess-style-guess-tabs-mode)
(add-hook 'python-mode-hook (lambda ()
                              (guess-style-guess-tab-width)))
(setq python-indent-offset 4)
