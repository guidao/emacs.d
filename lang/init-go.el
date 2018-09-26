
;; go mode
(use-package go-mode
  :ensure t
  :config
  (add-hook 'before-save-hook 'gofmt-before-save)
  (add-hook 'go-mode-hook 'init-go-mode-hook)
  )

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package flycheck-golangci-lint
  :ensure t
  :hook (go-mode . flycheck-golangci-lint-setup))

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

(with-eval-after-load 'evil
  (evil-set-command-property 'godef-jump :jump t))

(provide 'init-go)
