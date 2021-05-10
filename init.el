(require 'package)
;(setenv "LIBRARY_PATH" "/usr/local/opt/gcc/lib/gcc/10:/usr/local/opt/libgccjit/lib/gcc/10:/usr/local/opt/gcc/lib/gcc/10/gcc/x86_64-apple-darwin20/10.2.0")
(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                           ("melpa" . "http://elpa.emacs-china.org/melpa/")))

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))
(eval-when-compile
  (require 'use-package))

(use-package quelpa
  :ensure t
  :custom
  (quelpa-git-clone-depth 1)
  (quelpa-self-upgrade-p nil)
  (quelpa-update-melpa-p nil)
  (quelpa-checkout-melpa-p nil))

(use-package quelpa-use-package
  :ensure t
  :config
  (quelpa-use-package-activate-advice)
  :custom
  (quelpa-use-package-inhibit-loading-quelpa t))


(add-to-list 'load-path "~/.emacs.d/lang")
(add-to-list 'load-path "~/.emacs.d/lang/valign")
;(add-to-list 'load-path "~/.emacs.d/lang/company-english-helper")

(require 'init-basic)
(require 'init-ivy)
(require 'init-go)
(require 'init-elisp)
(require 'init-search)
(require 'init-region)
(require 'init-org)

(require 'init-haskell)
(require 'init-elixir)
(require 'init-rust)
(require 'init-python)
;(require 'ra-emacs-lsp)
(require 'valign)

(require 'wm)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aweshell-auto-suggestion-p nil)
 '(counsel-grep-base-command
   "ag -S --noheading --nocolor --nofilename --numbers '%s' %s")
 '(counsel-mode t)
 '(counsel-projectile-mode t nil (counsel-projectile))
 '(counsel-projectile-rg-initial-input '(ivy-thing-at-point))
 '(counsel-yank-pop-height 15 t)
 '(counsel-yank-pop-separator
   "
────────────────────────────────────────────────────────
")
 '(cua-mode t nil (cua-base))
 '(custom-safe-themes
   '("379a804655efccc13a3d446468992bfdfc30ff27d19cfda6f62c7f9c9e7a8a7d" "aa5dee47c85f12d166745ae56c778eb7833df3f6799c2b2d607d5b8da8f5f579" "3c2f28c6ba2ad7373ea4c43f28fcf2eed14818ec9f0659b1c97d4e89c99e091e" "801a567c87755fe65d0484cb2bded31a4c5bb24fd1fe0ed11e6c02254017acb2" "dbade2e946597b9cda3e61978b5fcc14fa3afa2d3c4391d477bdaeff8f5638c5" "e30e72b10b9c7887ff8adcd1a25b5c6eaa32665e0f8f40994e5b6d51069d3b2a" "93ed23c504b202cf96ee591138b0012c295338f38046a1f3c14522d4a64d7308" "e074be1c799b509f52870ee596a5977b519f6d269455b84ed998666cf6fc802a" "99ea831ca79a916f1bd789de366b639d09811501e8c092c85b2cb7d697777f93" "0cb1b0ea66b145ad9b9e34c850ea8e842c4c4c83abe04e37455a1ef4cc5b8791" "2f1518e906a8b60fac943d02ad415f1d8b3933a5a7f75e307e6e9a26ef5bf570" "5d09b4ad5649fea40249dd937eaaa8f8a229db1cec9a1a0ef0de3ccf63523014" "56911bd75304fdb19619c9cb4c7b0511214d93f18e566e5b954416756a20cc80" "1526aeed166165811eefd9a6f9176061ec3d121ba39500af2048073bea80911e" "3577ee091e1d318c49889574a31175970472f6f182a9789f1a3e9e4513641d86" "76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" "d71aabbbd692b54b6263bfe016607f93553ea214bc1435d17de98894a5c3a086" "bc836bf29eab22d7e5b4c142d201bcce351806b7c1f94955ccafab8ce5b20208" "be9645aaa8c11f76a10bcf36aaf83f54f4587ced1b9b679b55639c87404e2499" "d74c5485d42ca4b7f3092e50db687600d0e16006d8fa335c69cf4f379dbd0eee" "9b01a258b57067426cc3c8155330b0381ae0d8dd41d5345b5eddac69f40d409b" "fe94e2e42ccaa9714dd0f83a5aa1efeef819e22c5774115a9984293af609fce7" "15ba8081651869ec689c9004288bed79003de5b4ee9c51a9d4a208d9e3439706" "e47c0abe03e0484ddadf2ae57d32b0f29f0b2ddfe7ec810bd6d558765d9a6a6c" "a4b9eeeabde73db909e6b080baf29d629507b44276e17c0c411ed5431faf87dd" "a02836a5807a687c982d47728e54ff42a91bc9e6621f7fe7205b0225db677f07" "c6b93ff250f8546c7ad0838534d46e616a374d5cb86663a9ad0807fd0aeb1d16" "92d8a13d08e16c4d2c027990f4d69f0ce0833c844dcaad3c8226ae278181d5f3" default))
 '(ein:completion-backend 'ein:use-company-backend)
 '(ein:output-area-inlined-images t)
 '(enable-recursive-minibuffers t)
 '(global-evil-mc-mode t)
 '(go-test-verbose t)
 '(gofmt-args '("-format-only"))
 '(gofmt-command "goimports")
 '(helm-completion-style 'emacs)
 '(helm-ff-cache-mode t)
 '(helm-ff-cache-mode-post-delay 0.3)
 '(helm-ff-refresh-cache-delay 0.3)
 '(ivy-display-function 'ivy-posframe-display-at-frame-center t)
 '(ivy-on-del-error-function nil)
 '(ivy-posframe-font "Latin Modern Mono 14")
 '(ivy-posframe-parameters '((left-fringe . 5) (right-fringe . 5)))
 '(ivy-use-selectable-prompt t)
 '(ivy-use-virtual-buffers t)
 '(lsp-eldoc-hook nil)
 '(lsp-eldoc-render-all nil)
 '(lsp-ui-doc-enable nil)
 '(lsp-use-native-json t)
 '(org-babel-python-command "python3")
 '(org-bullets-bullet-list '("◉" "☯" "○" "☯" "✸" "☯" "✿" "☯" "✜" "☯" "◆" "☯" "▶"))
 '(org-format-latex-options
   '(:foreground default :background default :scale 3.0 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
		 ("begin" "$1" "$" "$$" "\\(" "\\[")))
 '(org-roam-directory "~/org/wiki")
 '(org-startup-with-inline-images t)
 '(package-selected-packages
   '(shrface dot-mode datetime datetime-format elisp-format amx flx spaceline-all-the-icons all-the-icons-ivy gnu-elpa-keyring-update lsp-mode ivy-rich ivy-posframe epc eaf xwwp-follow-link-ivy keyfreq ivy-prescient company-restclient know-your-http-well restclient expand-region thing-edit crux aweshell multiple-cursors evil-mc posframe web-beautify anzu rjsx-mode helm-org org-ql ov org-super-agenda ts counsel-projectile kubernetes-evil kubernetes nlinum quelpa-use-package quelpa company-math org-roam gkroam tao-theme ctable org-bullets htmlize ox-reveal ox-ioslide sis ob-go org-modules pdf-tools helm-rg go-playground vterm evil-org web-mode helm-dash evil-smartparens w3m lispyville lua-mode org-download php-mode ob-ipython elpy python-mode function-args semantic-directory protobuf-mode cargo smartparens smartparens-config company-go deft eyebrowse avy auto-complete hl-todo lsp-haskell json-mode helm-projectile elfeed idris-mode emms emms-setup lsp-ui doom-modeline helm-swoop gotest gotest\.el go-guru exec-path-from-shell go-mode helm helm-ebdb))
 '(pdf-tools-handle-upgrades nil)
 '(shell-pop-shell-type '("vterm" "*vterm*" (lambda nil (vterm))))
 '(sp-ignore-modes-list '(minibuffer-inactive-mode protobuf-mode))
 '(swiper-action-recenter t)
 '(warning-suppress-types '((comp) (use-package) (bytecomp)))
 '(xwwp-follow-link-completion-system 'helm t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ivy-posframe ((t (:background "#282a36"))))
 '(ivy-posframe-border ((t (:background "#6272a4"))))
 '(ivy-posframe-cursor ((t (:background "#61bfff"))))
 '(vertical-border ((t (:background "dark cyan" :foreground "dark cyan")))))
