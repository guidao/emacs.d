
;; go mode
(use-package go-mode
  :ensure t
  :config
  (add-hook 'before-save-hook 'gofmt-before-save)
  (add-hook 'go-mode-hook 'init-go-mode-hook)
  (add-hook 'go-mode-hook 'lsp)
  )


;; (use-package flycheck
;;   :ensure t
;;   :init (global-flycheck-mode))

;; (use-package flycheck-golangci-lint
;;   :ensure t
;;   :hook (go-mode . flycheck-golangci-lint-setup))

(use-package go-guru
  :ensure t)

(use-package gotest
  :ensure t)

(defun init-go-mode-hook ()
  (general-define-key
   :states 'normal
   :keymaps 'local
   :prefix "SPC"
   "mgg" '(godef-jump :which-key "godef goto define")
   "mia" '(go-import-add :which-key "package add")
   "mur" '(go-guru-referrers :which-key "guru referrers")
   "muj" '(go-guru-definition :which-key "guru definition")
   "mui" '(go-guru-implements :which-key "guru implementation")
   "mu<" '(go-guru-callers :which-key "guru callers")
   "mu>" '(go-guru-callees :which-key "guru callees")
   )
  (setq tab-width 4))

(global-set-key (kbd "M-n") 'company-capf)

(with-eval-after-load 'evil
  (evil-set-command-property 'godef-jump :jump t))


;; go-mod 的 go package add 太慢了，使用fd重现实现
(defun my-go-packages-native ()
  "Return a list of all installed Go packages.
It looks for archive files in /pkg/."
  (sort
   (delete-dups
    (cl-mapcan
     (lambda (topdir)
       (let ((pkgdir (concat topdir "/pkg/")))
	 (go-gackages pkgdir)
         	 ))
     (go-root-and-paths)))
   #'string<))

(defun go-gackages (topdir)
  "Rewrite go-mod my-go-packages-native.

   topdir is pkgdir"
  (--> (shell-command-to-string (concat "fd -e a . " topdir))
     (split-string it "\n")
     (-map (lambda (str)
	     (--> (string-remove-prefix topdir str)
		  (string-trim-left it ".*?/")
		  (string-remove-suffix ".a" it)
		  )
	     ) it)))



(defun my-go-packages-function()
  "Return a list of all Go packages, using `gopkgs'."
  (sort (process-lines "gopkgs") #'string<))

(setq go-packages-function 'my-go-packages-function)

(setq lsp-clients-go-diagnostics-enabled nil)



(provide 'init-go)
