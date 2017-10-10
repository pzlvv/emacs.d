(require 'evil)
(evil-mode 1)
(evil-escape-mode 1)

(require 'cl)
(loop for mode in '(calendar-mode eshell-mode gud-mode) do (evil-set-initial-state mode 'emacs))

(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)

(setq-default evil-escape-key-sequence "jk")
(setq-default evil-escape-delay 0.4)
(define-key evil-insert-state-map "\C-n" 'company-complete)
(define-key evil-insert-state-map "\C-p" 'company-complete)

(evil-declare-change-repeat 'company-complete)
