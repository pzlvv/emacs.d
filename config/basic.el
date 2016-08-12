(set-frame-parameter nil 'background-mode 'dark)
(load-theme 'solarized t)

(prefer-coding-system 'utf-8)
(setenv "LANG" "en_US.UTF8")

(global-linum-mode t)
(setq column-number-mode t)
(setq auto-save-default nil)
(setq make-backup-files nil)
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(global-font-lock-mode t)

(if (eq system-type 'windows-nt)
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font)
			charset
			(font-spec :family "Microsoft Yahei" :size 12))
	(set-frame-font "consolas 10")
)
  )


(require 'paren)
(setq show-paren-delay 0)
(set-face-background 'show-paren-match "#586e75")
(set-face-attribute 'show-paren-match nil :weight 'extra-bold)
(show-paren-mode 1)

(setq inhibit-startup-message t)

(require 'neotree)
(define-key neotree-mode-map (kbd "M-l") #'neotree-enter-horizontal-split)
(define-key neotree-mode-map (kbd "C-l") #'neotree-enter-vertical-split)
(global-set-key [f3] 'neotree-toggle)
(add-hook 'neotree-mode-hook
	  (lambda ()
	    (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
	    (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
	    (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
	    (define-key evil-insert-state-local-map (kbd "r") 'neotree-refresh)
	    (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))


(require 'window-numbering)
(window-numbering-mode 1)

(require 'go-autocomplete)
(require 'auto-complete-config)
(setq ac-ignore-case nil)
(ac-linum-workaround)
(setq ac-auto-start 4)
(ac-config-default)

(setq c-default-style
      '((java-mode . "java")
        (other . "linux")))
(setq c-basic-offset 4)

(require 'yasnippet)
(yas-global-mode 1)

