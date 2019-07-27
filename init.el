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
;(setq debug-on-error t)

(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))
(require 'use-package)
(add-to-list 'load-path "~/.emacs.d/lang")
(add-to-list 'load-path "~/.emacs.d/lang/lpy")

(require 'init-basic)
(require 'init-go)
(require 'init-elisp)
(require 'init-search)
(require 'init-region)
(require 'init-org)
(require 'init-haskell)
(require 'init-elixir)
(require 'init-rust)
(require 'init-python)
(require 'ra-emacs-lsp)

(defun my-debug (prefix a)
  (message "---:%s:%s" prefix a)
  a
  )


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-lsp-cache-candidates nil)
 '(ein:completion-backend (quote ein:use-company-backend))
 '(elfeed-feeds
   (quote
    ("https://www.zhihu.com/rss" "http://planet.emacsen.org/atom.xml")))
 '(elpy-rpc-python-command "python3")
 '(go-test-verbose t)
 '(jedi:server-command
   (quote
    ("python3" "/Users/wangfeng/.emacs.d/elpa/jedi-core-20181207.1/jediepcserver.py")) nil nil "(\"python3\" \"/Users/wangfeng/.emacs.d/elpa/jedi-core-20181207.1/jediepcserver.pyß\")")
 '(lsp-clients-go-server-args (quote ("-logfile=/Users/wangfeng/txt2.log")))
 '(lsp-eldoc-hook nil)
 '(lsp-eldoc-render-all nil)
 '(lsp-go-language-server-flags (quote ("-gocodecompletion" "-trace")))
 '(lsp-ui-doc-enable nil)
 '(lsp-use-native-json t)
 '(org-babel-load-languages (quote ((emacs-lisp . t) (python . t))))
 '(org-babel-python-command "python3")
 '(org-startup-with-inline-images t)
 '(package-selected-packages
   (quote
    (ob-ipython elpy python-mode function-args semantic-directory protobuf-mode cargo smartparens smartparens-config company-go deft eyebrowse avy auto-complete hl-todo lsp-haskell json-mode helm-projectile elfeed idris-mode emms emms-setup lsp-ui doom-modeline helm-swoop gotest gotest\.el go-guru exec-path-from-shell go-mode helm helm-ebdb)))
 '(shell-pop-shell-type
   (quote
    ("terminal" "*terminal*"
     (lambda nil
       (term shell-pop-term-shell))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
