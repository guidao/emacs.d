

(use-package cargo
  :ensure t)

(add-hook 'rust-mode-hook #'lsp)

(provide 'init-rust)
