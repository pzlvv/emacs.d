(require 'ansi-color)

(setq c-default-style
      '((java-mode . "java")
	(other . "ellemtel")))

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region compilation-filter-start (point))
  (toggle-read-only))

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

;(setq irony-additional-clang-options
;      (append '("-I" "inc") irony-additional-clang-options))

(require 'xcscope)
(cscope-setup)
