;;; init-rust.el --- xxxx
;;; Commentary:
;;; Code:

(use-package cargo
  :ensure t)

(add-hook 'rust-mode-hook #'lsp)

(provide 'init-rust)

;;; init-rust.el ends here
