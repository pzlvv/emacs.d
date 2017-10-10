;Uncomment the following lines if you are behind a proxy
(setq url-proxy-services
      '(("no_proxy" . "^\\(localhost\\|10.*\\|127.0.0.1\\)")
        ("http" . "10.135.193.246:3128")
        ("https" . "10.135.193.246:3128")))
(require 'package)
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-etags-requires 1)
 '(company-clang-arguments (quote ("-std=c++14")))
 '(package-selected-packages
   (quote
    (xcscope company-jedi company-go nlinum web-mode yasnippet js2-mode company tide zenburn-theme evil-escape helm yaml-mode magit feature-mode go-mode go-impl window-numbering window-number python-mode popup-complete neotree markdown-mode lua-mode key-chord json-mode colemak-evil auto-auto-indent auctex)))
 '(send-mail-function (quote mailclient-send-it)))

; if not all packages are installed, check one by one and install the missing ones.


(defconst user-init-dir "~/.emacs.d/config/")

(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))

(defun load-user-config (files)
  (if files (progn (load-file (car files)) (load-user-config (cdr files)) ) )
    )


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(package-refresh-contents)
(package-install-selected-packages)


(require 'find-lisp)
(load-user-config (find-lisp-find-files "~/.emacs.d/config" ".*\.el"))
