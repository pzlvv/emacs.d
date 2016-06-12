(require 'evil)
(evil-mode 1)

;(evil-set-initial-state 'calendar-mode 'emacs)
;(evil-set-initial-state 'eshell-mode 'emacs)
(loop for mode in '(calendar-mode eshell-mode) do (evil-set-initial-state mode 'emacs))

(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(setq key-chord-two-keys-delay 0.2)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(key-chord-mode 1)
