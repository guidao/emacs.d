;;; init-basic.el --- xxxx
;;; Commentary:
;;; Code:

;; 设置字体
(when (window-system)
  ;(set-frame-font "Fira Code 14")
  ;(set-frame-font "iosevka 15")
  ;(set-frame-font "Latin Modern Mono 18")
  (set-frame-font "Victor Mono 15")
  )

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

(use-package quelpa
  :ensure t
  :config
  (setq quelpa-update-melpa-p nil))

(use-package quelpa-use-package
  :ensure t
  :config
  (setq use-package-ensure-function 'quelpa))



(use-package sis
  :hook
  ;; enable the /follow context/ and /inline region/ mode for specific buffers
   (((text-mode prog-mode) . sis-follow-context-mode)
   ((text-mode prog-mode) . sis-inline-mode))

  :config
  ;; For MacOS
  (sis-ism-lazyman-config
  
   ;; English input source may be: "ABC", "US" or another one.
   ;; "com.apple.keylayout.ABC"
   "com.apple.keylayout.ABC"

   ;; Other language input source: "rime", "sogou" or another one.
   ;; "im.rime.inputmethod.Squirrel.Rime"
   "com.sogou.inputmethod.sogou.pinyin")

  ;; enable the /cursor color/ mode
  (sis-global-cursor-color-mode t)
  ;; enable the /respect/ mode
  (sis-global-respect-mode t)
  ;; enable the /follow context/ mode for all buffers
  (sis-global-follow-context-mode t)
  ;; enable the /inline english/ mode for all buffers
  (sis-global-inline-mode t)
)

;;全局行号
(global-display-line-numbers-mode 1)

;;最近文件
(recentf-mode 1)

;; 关闭启动画面
(setq inhibit-splash-screen t)

;; 使用y n替代yes no
(fset 'yes-or-no-p 'y-or-n-p)

;; matching parens
(show-paren-mode 1)
(electric-pair-mode 1)

;; disable backup files
(setq make-backup-files nil)
(setq auto-save-default nil)

(setq-default left-fringe-width 0)

;; titlebar
(add-to-list 'default-frame-alist '(ns-transparent-titlebar .t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))
;;(setq ns-use-proxy-icon nil)
(setq frame-title-format nil)

;; ;; mini UI
(if (display-graphic-p)
  (scroll-bar-mode -1)
(menu-bar-mode   -1))
(tool-bar-mode   -1)
(tooltip-mode    -1)


(defun org-insert-image ()
  (interactive)
  (let* ((path (concat default-directory "img/"))
	 (image-file (concat path (buffer-name)
		       (format-time-string "_%Y%m%d_%H%M%S.png"))))
	  (if (not (file-exists-p path))
	    (mkdir path))
	  (shell-command (concat "pngpaste " image-file))
	  (org-insert-link nil (concat "file:" image-file) ""))
      ;; (org-display-inline-images) ;; inline显示图片
)


(use-package org-download
  :ensure t)

;; mac复制shell环境变量
(use-package exec-path-from-shell
  :ensure t
  :config
 (when (memq window-system '(mac ns x))
   (exec-path-from-shell-initialize)
   (exec-path-from-shell-copy-env "GOPATH")))


(use-package magit
  :ensure t
  :config)

;; 开启yas
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
  ;;(load-theme 'doom-molokai t)
  (load-theme 'doom-palenight t)
  ;;(load-theme 'doom-gruvbox t)
  )


;; helm
;; (use-package helm
;;   :ensure t
;;   :init
;;   (setq-default helm-M-x-fuzzy-match t
;; 	helm-mode-fuzzy-match t
;; 	helm-buffers-fuzzy-matching t
;; 	helm-recentf-fuzzy-match t
;; 	helm-locate-fuzzy-match t
;; 	helm-semantic-fuzzy-match t
;; 	helm-imenu-fuzzy-match t
;; 	helm-completion-in-region-fuzzy-match t
;; 	helm-candidate-number-list 150
;; 	helm-split-window-in-side-p t
;; 	helm-move-to-line-cycle-in-source t
;; 	helm-echo-input-in-header-line t
;; 	helm-autoresize-max-height 0
;; 	helm-autoresize-min-height 20)
;;   :config
;;   (helm-mode))


(global-set-key (kbd "M-x") 'counsel-M-x)

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
  :hook (after-init . doom-modeline-mode))

;;flycheck
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))


;; keybinding
(use-package general
  :ensure t
  :config (general-define-key
	   :states '(normal visual insert emacs)
	   :prefix "SPC"
	   :non-normal-prefix "M-SPC"
	   "TAB" '(evil-switch-to-windows-last-buffer :which-key "previous buffer")
	   "SPC" '(counsel-M-x :which-key "M-x")
	   "ff" '(counsel-find-file :which-key "find files")
	   "bb" '(ivy-switch-buffer :which-key "buffers list")
	   ;;"kr" '(helm-show-kill-ring :which-key "kill ring")
	   "gb" '(pop-tag-mark :which-key "goto back")
	   "pp" '(er/expand-region :which-key "expand region")
	   "pf" '(counsel-projectile-find-file :which-key "project find file")
	   "pg" '(counsel-projectile-rg :which-key "project rg grep")
	   "wl" '(windmove-right :which-key "move right")
	   "wh" '(windmove-left :which-key "move left")
	   "wk" '(windmove-up :which-key "move up")
	   "wj" '(windmove-down :which-key "move bottom")
	   "ww" '(other-window :which-key "switch window")
	   "w/" '(split-window-right :which-key "split right")
	   "w-" '(split-window-below :which-key "split bottom")
	   "wx" '(delete-window :which-key "delete window")
	   "aa" '(org-agenda :which-key "org agenda")
	   "mgg" '(evil-goto-definition :which-key "goto definition")

	   "at" '(shell-pop :which-key "open terminal")))



(defun init-cc-mode ()
  (general-define-key
   :states 'normal
   :keymaps 'c-mode-map
   :prefix "SPC"
   ;;"mgg" '(helm-gtags-find-tag :which-key "goto definition")
   )
)

(add-hook 'c-mode-hook 'init-cc-mode)



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


(use-package company-lsp
  :ensure t
  :config
  (push 'company-lsp company-backends))

(use-package lsp-mode
  :ensure t
  :config
  (require 'lsp)
  (require 'lsp-clients)
  ;(add-hook 'prog-mode-hook 'lsp)
  (general-define-key
   :states 'normal
   :prefix "g"
   "i" '(lsp-find-implementation :which-key "lsp find implement")
   "r" '(lsp-find-references :which-key "lsp find references")
   ))

(use-package lsp-ui
  :ensure t
  :config
  (add-hook 'lsp-mode-hook 'lsp-ui-mode)
  )


(use-package elfeed
  :ensure t
  :config
  (setq elfeed-feeds
	'("https://colobu.com/atom.xml")))

;; (use-package helm-projectile
;;   :ensure t
;;   :config
;;   (helm-projectile-on)
;;   (general-define-key
;;    :states 'normal
;;    :prefix "SPC"
;;       ))

(use-package json-mode
  :ensure t
  )

(toggle-truncate-lines 1)
(setq-default truncate-lines t)

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
  :ensure t
  :config
  )

(use-package multi-term
  :ensure t
  :config)

(use-package protobuf-mode
  :ensure t
  :config)

(use-package yaml-mode
  :ensure t
  :config)

;; (use-package helm-gtags
;;   :ensure t
;;   :config)


(defun wf/json-reformat-string ()
  (interactive)
  (let* ((begin (region-beginning))
	(end (region-end))
	(f (buffer-substring-no-properties begin end))
	(ff (format "%s" f)))
    (delete-region begin end)
    (goto-char begin)
    (insert (json-reformat-from-string (car (read-from-string ff))))))


;; (defun org-insert-clipboard-image (&optional file)
;;   (interactive "F")
;;   (shell-command (concat "pngpaste " file))
;;   (insert (concat "[[" file "]]"))
;;   (org-display-inline-images))


;;org代码执行后显示图片
(add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)
;; 执行不用询问
(setq-default org-confirm-babel-evaluate nil)

(setq company-idle-delay 0)
(setq default-directory "~/")


(use-package lua-mode
  :ensure t)

(use-package xwwp-full
  :load-path "~/.emacs.d/xwwp"
  :custom
  (xwwp-follow-link-completion-system 'ivy)
  :bind (:map xwidget-webkit-mode-map
              ("v" . xwwp-follow-link)
              ("t" . xwwp-ace-toggle)))


;; (use-package helm-dash
;;   :ensure t
;;   :init
;;   (require 'xwwp)
;;   :config
;;   (setq helm-dash-browser-func 'browse-url)
;;   ;(setq helm-dash-browser-func 'xwwp)
;;   (mapc 'helm-dash-activate-docset (helm-dash-installed-docsets))
;;   )


(use-package vterm
  :ensure t
  :config
  (evil-define-key* 'insert vterm-mode-map
  (kbd "C-r") #'vterm--self-insert))

(use-package tao-theme
  :ensure t)


(defun kill-other-buffers ()
    "Kill all other buffers."
    (interactive)
    (mapc 'kill-buffer 
      (delq (current-buffer) 
        (remove-if-not 'buffer-file-name (buffer-list)))))


;; 设置系统剪切板
(unless (window-system)
 (defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))
 (defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))
 (setq interprogram-cut-function 'paste-to-osx)
 (setq interprogram-paste-function 'copy-from-osx))

(defun add-bracket-on-region ()
  "在region上添加括号."
  (interactive)
  (if (region-active-p)
      (let ((begin (region-beginning))
	    (end (region-end)))
	(save-excursion
	  (goto-char begin)
	  (insert "(")
	  (goto-char (+ end 1))
	  (insert ")")))
      (error "Not active region")))

(defun eval-form-on-region ()
  (interactive)
  (if (region-active-p)
      (let* ((begin (region-beginning))
	     (end (region-end))
	     (input (buffer-substring-no-properties begin end))
	     )
	(-as->
	 (read-minibuffer "enter expression(region text as input var): ")
	 as
	 (eval-expression as)
	 (save-excursion
	   (goto-char begin)
	   (delete-region begin end)
	   (insert as)
	   )
	 )
	)
      (error "No active region"))
  )

(use-package posframe
  :ensure t)

;; (use-package ivy
;;   :ensure t
;;   :hook
;;     (ivy-mode . ivy-posframe-enable)
;;   :custom-face
;;     (ivy-posframe ((t (:background "#282a36"))))
;;     (ivy-posframe-border ((t (:background "#6272a4"))))
;;     (ivy-posframe-cursor ((t (:background "#61bfff"))))
;;   :config
;;   (setq ivy-posframe-font "Latin Modern Mono 14")
;;   (setq ivy-fixed-height-minibuffer nil
;;         ivy-posframe-border-width 1 
;;         ivy-posframe-parameters '((left-fringe . 8) (right-fringe . 8))))





(use-package pdf-tools
      :ensure t
      :config
      (custom-set-variables
        '(pdf-tools-handle-upgrades nil)) ; Use brew upgrade pdf-tools instead.
     (setq pdf-info-epdfinfo-program "/usr/local/bin/epdfinfo"))



(when (eq system-type 'darwin)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier nil))

(use-package crux :ensure t)

(use-package thing-edit
  :ensure t
  :quelpa (thing-edit :fetcher github :repo "manateelazycat/thing-edit")
  )


(require 'aweshell)

(provide 'init-basic)
;;; init-basic.el ends here
