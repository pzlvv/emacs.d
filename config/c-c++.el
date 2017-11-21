(require 'ansi-color)
(require 'rtags)

(setq c-default-style
      '((java-mode . "java")
	(other . "ellemtel")))

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region compilation-filter-start (point))
  (toggle-read-only))

(defun my/c++-mode-hook ()
  (setq-local
   company-clang-arguments '("-std=c++14"))
  )

(defun my/c-mode-hook ()
  (setq-local
   company-clang-arguments '("-std=c11"))
  )

(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)
(add-hook 'c++-mode-hook 'my/c++-mode-hook)
(add-hook 'c-mode-hook 'my/c-mode-hook)

(add-hook 'c-mode-hook 'rtags-start-process-unless-running)
(add-hook 'c++-mode-hook 'rtags-start-process-unless-running)

(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

(require 'xcscope)
(cscope-setup)

(setq rtags-autostart-diagnostics t)
(setq rtags-display-result-backend 'helm)
(rtags-enable-standard-keybindings)
(rtags-diagnostics)
