(set-frame-parameter nil 'background-mode 'dark)
(load-theme 'zenburn  t)

(prefer-coding-system 'utf-8)
(setenv "LANG" "en_US.UTF8")

(global-nlinum-mode t)
(if (not (display-graphic-p)) (setq nlinum-format "%d "))

(defun infer-indentation-style ()
  ;; if our source file uses tabs, we use tabs, if spaces spaces, and if        
  ;; neither, we use the current indent-tabs-mode                               
  (let ((space-count (how-many "^  " (point-min) (point-max)))
        (tab-count (how-many "^\t" (point-min) (point-max))))
    (if (> space-count tab-count) (setq indent-tabs-mode nil))
    (if (> tab-count space-count) (setq indent-tabs-mode t))))

(setq-default indent-tabs-mode nil)
(infer-indentation-style)
(setq-default tab-width 4)
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'python-indent 'tab-width)

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


(require 'yasnippet)
(yas-global-mode 1)

