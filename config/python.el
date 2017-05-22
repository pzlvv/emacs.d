(require 'python-mode)

(eval-after-load "company"
 '(add-to-list 'company-backends '(company-anaconda :with company-capf)))

;; Run python and pop-up its shell.
;; Kill process to solve the reload modules problem.
;;(defun my-python-shell-run ()
;;  (interactive)
;;  (when (get-buffer-process "*Python*")
;;     (set-process-query-on-exit-flag (get-buffer-process "*Python*") nil)
;;     (kill-process (get-buffer-process "*Python*"))
;;     ;; If you want to clean the buffer too.
;;     ;;(kill-buffer "*Python*")
;;     ;; Not so fast!
;;     (sleep-for 0.5))
;;  (run-python (python-shell-parse-command) nil nil)
;;  (python-shell-send-buffer)
;;  ;; Pop new window only if shell isnt visible
;;  ;; in any frame.
;;  (unless (get-buffer-window "*Python*" t) 
;;    (python-shell-switch-to-shell)))
;;
;;(defun my-python-shell-run-region ()
;;  (interactive)
;;  (python-shell-send-region (region-beginning) (region-end))
;;  (python-shell-switch-to-shell))
;;
;;(eval-after-load "python"
;;  '(progn
;;     (define-key python-mode-map (kbd "C-c C-c") 'my-python-shell-run)
;;     (define-key python-mode-map (kbd "C-c C-r") 'my-python-shell-run-region)
;;     (define-key python-mode-map (kbd "C-h f") 'python-eldoc-at-point)))
