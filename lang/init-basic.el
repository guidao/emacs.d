;; 设置字体
(when (window-system)
  (set-frame-font "Fira Code"))
(let ((alist '((33 . ".\\(?:\\(?:==\\|!!\\)\\|[!=]\\)")
               (35 . ".\\(?:###\\|##\\|_(\\|[#(?[_{]\\)")
               (36 . ".\\(?:>\\)")
               (37 . ".\\(?:\\(?:%%\\)\\|%\\)")
               (38 . ".\\(?:\\(?:&&\\)\\|&\\)")
               (42 . ".\\(?:\\(?:\\*\\*/\\)\\|\\(?:\\*[*/]\\)\\|[*/>]\\)")
               (43 . ".\\(?:\\(?:\\+\\+\\)\\|[+>]\\)")
               (45 . ".\\(?:\\(?:-[>-]\\|<<\\|>>\\)\\|[<>}~-]\\)")
               (46 . ".\\(?:\\(?:\\.[.<]\\)\\|[.=-]\\)")
               (47 . ".\\(?:\\(?:\\*\\*\\|//\\|==\\)\\|[*/=>]\\)")
               (48 . ".\\(?:x[a-zA-Z]\\)")
               (58 . ".\\(?:::\\|[:=]\\)")
               (59 . ".\\(?:;;\\|;\\)")
               (60 . ".\\(?:\\(?:!--\\)\\|\\(?:~~\\|->\\|\\$>\\|\\*>\\|\\+>\\|--\\|<[<=-]\\|=[<=>]\\||>\\)\\|[*$+~/<=>|-]\\)")
               (61 . ".\\(?:\\(?:/=\\|:=\\|<<\\|=[=>]\\|>>\\)\\|[<=>~]\\)")
               (62 . ".\\(?:\\(?:=>\\|>[=>-]\\)\\|[=>-]\\)")
               (63 . ".\\(?:\\(\\?\\?\\)\\|[:=?]\\)")
               (91 . ".\\(?:]\\)")
               (92 . ".\\(?:\\(?:\\\\\\\\\\)\\|\\\\\\)")
               (94 . ".\\(?:=\\)")
               (119 . ".\\(?:ww\\)")
               (123 . ".\\(?:-\\)")
               (124 . ".\\(?:\\(?:|[=|]\\)\\|[=>|]\\)")
               (126 . ".\\(?:~>\\|~~\\|[>=@~-]\\)")
               )
             ))
  (dolist (char-regexp alist)
    (set-char-table-range composition-function-table (car char-regexp)
                          `([,(cdr char-regexp) 0 font-shape-gstring]))))

;; 开启全局行号
(global-linum-mode 1)

;;最近文件
(recentf-mode 1)

;; 关闭启动画面
(setq inhibit-splash-screen t)

;; 使用y n替代yes no
(fset 'yes-or-no-p 'y-or-n-p)

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
(if (display-graphic-p)
    (scroll-bar-mode -1)
(menu-bar-mode   -1))
(tool-bar-mode   -1)
(tooltip-mode    -1)


;; mac复制shell环境变量
(use-package exec-path-from-shell
  :ensure t
  :config
 (when (memq window-system '(mac ns x))
   (exec-path-from-shell-initialize)
   (exec-path-from-shell-copy-env "GOPATH")))

;; 开启yas
(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1)
  (add-to-list 'yas-snippet-dirs "/Users/wangfeng/.emacs.d/snippets/yasnippet-go"))

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
(global-set-key (kbd "M-x") 'helm-M-x)

;; wich key
(use-package which-key
  :ensure t
  :init
  (setq which-key-separator " ")
  (setq which-key-prefix-prefix "+")
  :config
  (which-key-mode 1))

(use-package doom-modeline
      :ensure t
      :defer t
      :hook (after-init . doom-modeline-init))

;; keybinding
(use-package general
  :ensure t
  :config (general-define-key
	   :states '(normal visual insert emacs)
	   :prefix "SPC"
	   :non-normal-prefix "M-SPC"
	   "TAB" '(evil-switch-to-windows-last-buffer :which-key "previous buffer")
	   "SPC" '(helm-M-x :which-key "M-x")
	   "ff" '(helm-find-files :which-key "find files")
	   "bb" '(helm-buffers-list :which-key "buffers list")
	   "kr" '(helm-show-kill-ring :which-key "kill ring")
	   "gb" '(pop-tag-mark :which-key "goto back")

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

(use-package lsp-rust
  :ensure t)

(use-package lsp-go
  :ensure t
  :config
  ;(add-hook 'go-mode-hook #'lsp-go-enable)
  (add-hook 'rust-mode-hook #'lsp-rust-enable)
  (add-hook 'rust-mode-hook #'flycheck-mode))


;; (use-package lsp-ui
;;   :ensure t
;;   :config
;;   (add-hook 'lsp-mode-hook 'lsp-ui-mode))


(use-package elfeed
  :ensure t
  :config
  (setq elfeed-feeds
	'("http://planet.emacsen.org/atom.xml"
	  "https://zhihu.com/rss"))
  )

(use-package helm-projectile
  :ensure t
  :config
  (helm-projectile-on)
  (general-define-key
   :states 'normal
   :prefix "SPC"
   "pf" '(helm-projectile-find-file :which-key "project find file")
   ))

(use-package json-mode
  :ensure t
  )
(toggle-truncate-lines 1)

(use-package hl-todo
  :ensure t
  :config
  (global-hl-todo-mode))



(use-package avy
  :ensure t
  :config
  (general-define-key
   :states 'normal
   :prefix "g"
   "l" '(avy-goto-line :which-key "goto line")
   "c" '(avy-goto-char :which-key "goto char")
   )
  )

;;窗口管理
(use-package eyebrowse
  :ensure t
  :config
  (eyebrowse-mode t))


;; 笔记管理
(use-package deft
  :ensure t
  :config
  (setq deft-extensions '("org" "txt" "md" "markdown" "text"))
  (setq deft-default-extension "org")
  )

(use-package smartparens
  :ensure t
  :config
  (require 'smartparens-config)
  (smartparens-global-mode))

(use-package shell-pop
  :ensure t)

(provide 'init-basic)
;;; init-basic ends here
