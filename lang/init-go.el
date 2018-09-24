
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

(defun init-go-mode-hook ()
  (general-define-key
   :states 'normal
   :keymaps 'local
   :prefix "SPC"
   "mgg" '(godef-jump :which-key "godef goto define")
   "mia" '(go-import-add :which-key "package add")
   )
  (setq tab-width 4)
  )

(provide 'init-go)
