(require 'neotree)
(global-set-key [f5] 'neotree-toggle)
(add-hook 'neotree-mode-hook
	  (lambda ()
	    (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-stretch-toggle)
	    (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
	    (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
	    (define-key evil-insert-state-local-map (kbd "r") 'neotree-refresh)
	    (define-key evil-normal-state-local-map (kbd "-") 'neotree-enter-horizontal-split)
	    (define-key evil-normal-state-local-map (kbd "|") 'neotree-enter-vertical-split)
	    (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))

;; Set M-0 with neotree
(defun set-window-number-0 ()
  "Refs spacemacs."
  (defun spacemacs//window-numbering-assign (windows)
    "Custom number assignment for special buffers."
    (mapc (lambda (w)
            (when (and (boundp 'neo-global--window)
                       (eq w neo-global--window))
              (window-numbering-assign w 0)))
          windows))
  (add-hook 'window-numbering-before-hook 'spacemacs//window-numbering-assign))

(setq window-numbering-auto-assign-0-to-minibuffer nil)

(set-window-number-0)
