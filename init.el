(require 'package)
(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                           ("melpa" . "http://elpa.emacs-china.org/melpa/")))

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(use-package exec-path-from-shell
  :ensure t
  :config
 (when (memq window-system '(mac ns x))
   (exec-path-from-shell-initialize)
   (exec-path-from-shell-copy-env "GOPATH")))




(fset 'yes-or-no-p 'y-or-n-p)

(add-to-list 'load-path "~/.emacs.d/lang")

(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))

(require 'use-package)
(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))

;; evil mode
(use-package evil
	:ensure t
	:config
	(evil-mode 1))

(use-package evil-escape
  :ensure t
  :init
  (setq-default evil-escape-key-sequence "jk")
  :config
  (evil-escape-mode 1))

;; theme
(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-molokai t))

;; helm
(use-package helm
  :ensure t
  :init
  (setq helm-M-x-fuzzy-match t
	helm-mode-fuzzy-match t
	helm-buffers-fuzzy-matching t
	helm-recentf-fuzzy-match t
	helm-locate-fuzzy-match t
	helm-semantic-fuzzy-match t
	helm-imenu-fuzzy-match t
	helm-completion-in-region-fuzzy-match t
	helm-candidate-number-list 150
	helm-split-window-in-side-p t
	helm-move-to-line-cycle-in-source t
	helm-echo-input-in-header-line t
	helm-autoresize-max-height 0
	helm-autoresize-min-height 20)
  :config
  (helm-mode 1))

;; wich key
(use-package which-key
  :ensure t
  :init
  (setq which-key-separator " ")
  (setq which-key-prefix-prefix "+")
  :config
  (which-key-mode 1))

;;powerline
(use-package powerline
  :ensure t
  :config
  (powerline-vim-theme))

;; keybinding
(use-package general
  :ensure t
  :config (general-define-key
	   :states '(normal visual insert emacs)
	   :prefix "SPC"
	   :non-normal-prefix "M-SPC"
	   "TAB" '(switch-to-prev-buffer :which-key "previous buffer")
	   "SPC" '(helm-M-x :which-key "M-x")
	   "ff" '(helm-find-files :which-key "find files")
	   "bb" '(helm-buffers-list :which-key "buffers list")
	   "kr" '(helm-show-kill-ring :which-key "kill ring")

	   "wl" '(windmove-right :which-key "move right")
	   "wh" '(windmove-left :which-key "move left")
	   "wk" '(windmove-up :which-key "move up")
	   "wj" '(windmove-down :which-key "move bottom")
	   "ww" '(other-window :which-key "switch window")
	   "w/" '(split-window-right :which-key "split right")
	   "w-" '(split-window-below :which-key "split bottom")
	   "wx" '(delete-window :which-key "delete window")

	   "mgg" '(evil-goto-definition :which-key "goto definition")

	   "at" '(ansi-term :which-key "open terminal")))


;; project
(use-package projectile
  :ensure t
  :init
  (setq projectile-require-project-root nil)
  :config
  (projectile-mode 1))

;; matching parens
(setq show-paren-delay 0)
(show-paren-mode 1)
(electric-pair-mode 1)


;; disable backup files
(setq make-backup-files nil)
(setq auto-save-default nil)

;; titlebar
(add-to-list 'default-frame-alist '(ns-transparent-titlebar .t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))
(setq ns-use-proxy-icon nil)
(setq frame-title-format nil)

;; mini UI
(scroll-bar-mode -1)
(tool-bar-mode   -1)
(tooltip-mode    -1)
;;(menu-bar-mode   -1)

;; 补全
(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode))

;; (use-package eglot
;;   :ensure t
;;   :config
;;   (add-to-list 'eglot-server-programs
;; 	       '(go-mode . ("go-langserver" "-mode=stdio" "-gocodecompletion"))))
(use-package company-lsp
  :ensure t
  :config
  (push 'company-lsp company-backends))


(use-package lsp-go
  :ensure t
  :config
  (add-hook 'go-mode-hook #'lsp-go-enable))


(require 'init-go)
(require 'init-elisp)
(require 'init-search)
(require 'init-basic)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(lsp-go-language-server-flags (quote ("-gocodecompletion" "-trace")))
 '(package-selected-packages
   (quote
    (exec-path-from-shell auto-complete go-mode helm helm-ebdb))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
