(require 'ansi-color)
(require 'semantic/ia)
(require 'semantic/bovine/gcc)

(custom-set-variables
 '(company-clang-arguments '("-std=c++14")))

(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region compilation-filter-start (point))
  (toggle-read-only))

(defun my/c++-mode-hook ()
  )

(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)
(add-hook 'c++-mode-hook 'my/c++-mode-hook)

(require 'xcscope)
(cscope-setup)
