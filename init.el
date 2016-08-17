(setq url-proxy-services
      '(("no_proxy" . "^\\(localhost\\|10.*\\)")
        ("http" . "127.0.0.1:3128")
        ("https" . "127.0.0.1:3128")))
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://stable.melpa.org/packages/"))
(package-initialize)
(defvar required-packages
  '(auto-complete evil neotree window-numbering key-chord color-theme-solarized yasnippet
  ) "a list of packages to ensure are installed at launch.")

(require 'cl)
; method to check if all packages are installed
(defun packages-installed-p()
  (loop for p in required-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

; if not all packages are installed, check one by one and install the missing ones.
(unless (packages-installed-p)
  ; check for new packages (package versions)
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ; install the missing packages
  (dolist (p required-packages)
    (when (not (package-installed-p p))
      (package-install p))))

(defconst user-init-dir "~/.emacs.d/config/")

(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))

(load-user-file "evil.el")
(load-user-file "custom.el")
(load-user-file "basic.el")

(require 'ox-md nil t)
(setq org-src-fontify-natively t)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))


(global-set-key (kbd "C-x m") 'buffer-menu)

(setq preview-image-type 'pnm)

(setq tags-file-name "~/ctags/TAGS")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-etags-requires 1)
 '(package-selected-packages
   (quote
    (## magit feature-mode go-autocomplete go-impl window-numbering window-number python-mode popup-complete neotree markdown-mode lua-mode key-chord json-mode color-theme-solarized color-theme-sanityinc-solarized colemak-evil auto-auto-indent auctex ac-etags))))

(eval-after-load "etags"
  '(progn
      (ac-etags-setup)))

(add-hook 'c-mode-common-hook 'ac-etags-ac-setup)
(add-hook 'ruby-mode-common-hook 'ac-etags-ac-setup)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
