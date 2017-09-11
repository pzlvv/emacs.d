(require 'company)
(require 'company-go)

(setq gofmt-command "goimports")

(add-hook 'go-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'gofmt-before-save)
            (setq tab-width 4)
            (setq indent-tabs-mode 1)
            (set (make-local-variable 'company-backends) '(company-go))
            (company-mode)
            ))

