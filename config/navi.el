(global-set-key (kbd "C-c C-f") 'helm-imenu)

(require 'rtags)
(require 'evil)

(add-hook 'c-mode-hook 'rtags-start-process-unless-running)
(add-hook 'c++-mode-hook 'rtags-start-process-unless-running)
(setq rtags-autostart-diagnostics t)
(setq rtags-display-result-backend 'helm)

(rtags-diagnostics)

(defun rtags-evil-find-symbol-at-point()
  (interactive)
  (unless (progn
            (evil--jumps-push)
            (rtags-find-symbol-at-point))
    (evil--jumps-pop)
    ))

(global-set-key (kbd "C-c r .") 'rtags-evil-find-symbol-at-point)

(defun evil--jumps-pop()
  (ring-remove (evil--jumps-get-window-jump-list) -1))
