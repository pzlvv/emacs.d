(global-set-key  [f8] (lambda () (interactive) (find-file "~/.notes/note.org")))
(global-set-key  [f7] (lambda () (interactive) (find-file "~/.notes/todo.org")))

(global-set-key (kbd "C-x g") 'magit-status)
(add-to-list 'auto-mode-alist '("\\.prototxt\\'" . conf-mode))
