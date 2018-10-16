(require 'package)
(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                         ("melpa" . "http://elpa.emacs-china.org/melpa/")
                         ;;("org" . "https://orgmode.org/elpa/")
			 ;;("melpa-stable" . "https://stable.melpa.org/packages/")
			 ))

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))
(require 'use-package)
(add-to-list 'load-path "~/.emacs.d/lang")



(require 'init-basic)
(require 'init-go)
(require 'init-elisp)
(require 'init-search)
(require 'init-region)
(require 'init-org)
(require 'init-haskell)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elfeed-feeds
   (quote
    ("https://www.zhihu.com/rss" "http://planet.emacsen.org/atom.xml")))
 '(lsp-go-language-server-flags (quote ("-gocodecompletion" "-trace")))
 '(package-selected-packages
   (quote
    (auto-complete hl-todo lsp-haskell json-mode helm-projectile elfeed idris-mode emms emms-setup lsp-ui doom-modeline helm-swoop gotest gotest\.el go-guru exec-path-from-shell go-mode helm helm-ebdb))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
