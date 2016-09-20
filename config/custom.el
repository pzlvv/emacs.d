(global-set-key  [f8] (lambda () (interactive) (find-file "E:/notes/note.org")))
(global-set-key  [f7] (lambda () (interactive) (find-file "E:/tmp/draft.txt")))


(global-set-key (kbd "C-x g") 'magit-status)


(setq gofmt-command "goimports")
(add-hook 'go-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'gofmt-before-save)
            (setq tab-width 4)
            (setq indent-tabs-mode 1)))

(setq-default ac-sources nil)
