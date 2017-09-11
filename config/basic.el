(set-frame-parameter nil 'background-mode 'dark)
(load-theme 'zenburn  t)

(prefer-coding-system 'utf-8)
(setenv "LANG" "en_US.UTF8")

(global-nlinum-mode t)
(if (not (display-graphic-p)) (setq nlinum-format "%d "))


(setq column-number-mode t)
(setq auto-save-default nil)
(setq make-backup-files nil)
(tool-bar-mode 0)
(menu-bar-mode 0)
(when (display-graphic-p) (scroll-bar-mode 0))
(global-font-lock-mode t)

(if (display-graphic-p)
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font)
			charset
			(font-spec :family "Microsoft Yahei" :size 12))
      (set-frame-font "Source Code Pro Bold 10")
      )
  )

(require 'paren)
(setq show-paren-delay 0)
(set-face-background 'show-paren-match "#586e75")
(set-face-attribute 'show-paren-match nil :weight 'extra-bold)
(show-paren-mode 1)

(setq inhibit-startup-message t)

(require 'window-numbering)
(window-numbering-mode 1)

(add-hook 'after-init-hook 'global-company-mode)
(setq company-dabbrev-downcase nil)

(with-eval-after-load 'company
  (define-key company-active-map (kbd "C-n") 'company-select-next-or-abort)
  (define-key company-active-map (kbd "C-p") 'company-select-previous-or-abort)
  )


(setq c-default-style
      '((java-mode . "java")
	(other . "ellemtel")))
(setq c-basic-offset 4)

(require 'yasnippet)
(yas-global-mode 1)
