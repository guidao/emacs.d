;;; init-go.el --- xxxx
;;; Commentary:
;;; Code:


(use-package go-mode
  :ensure t
  :config
  (add-hook 'before-save-hook 'gofmt-before-save)
  (add-hook 'go-mode-hook 'init-go-mode-hook)
  (add-hook 'go-mode-hook 'lsp))



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
   ;; "mgg" '(godef-jump :which-key "godef goto define")
   "mgg" '(lsp-find-definition :which-key "lsp goto define")
   "mia" '(go-import-add :which-key "package add")
   "mur" '(go-guru-referrers :which-key "guru referrers")
   "muj" '(go-guru-definition :which-key "guru definition")
   "mui" '(go-guru-implements :which-key "guru implementation")
   "mu<" '(go-guru-callers :which-key "guru callers")
   "mu>" '(go-guru-callees :which-key "guru callees")
   )
  (setenv "GO111MODULE" "on")
  (push 'go-golint flycheck-disabled-checkers)
  (setq tab-width 4))



(global-set-key (kbd "M-n") 'company-capf)

(with-eval-after-load 'evil
  (evil-set-command-property 'godef-jump :jump t)
  (evil-set-command-property 'helm-gtags-find-tag :jump t)
  )


(defun my-go-packages-function()
  "Return a list of all Go packages, using `gopkgs'."
  (sort (process-lines "gopkgs" "-workDir" ".") #'string<))

(setq go-packages-function 'my-go-packages-function)

(setq gofmt-command "goimports")


(provide 'init-go)

;;; init-go.el ends here
