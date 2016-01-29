(setq url-proxy-services
      '(("no_proxy" . "^\\(localhost\\|10.*\\)")
        ("http" . "127.0.0.1:3128")
        ("https" . "127.0.0.1:3128")))

(require 'package)
(push '("marmalade" . "http://marmalade-repo.org/packages/")
      package-archives )
(push '("melpa" . "http://melpa.milkbox.net/packages/")
      package-archives)
(package-initialize)


(require 'evil)
(evil-mode 1)

(evil-set-initial-state 'calendar-mode 'emacs)

(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(setq key-chord-two-keys-delay 0.4)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(key-chord-mode 1)

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
(set-frame-font "consolas 10")

(dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      charset
                      (font-spec :family "Microsoft Yahei" :size 12)))


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


(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20151211.227/dict")
(ac-config-default)

(require 'ox-md nil t)
(setq org-src-fontify-natively t)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))

;(setq inferior-lisp-program "D:/Program Files/ccl/wx86cl64.exe")
(setq inferior-lisp-program "wx86cl64")
