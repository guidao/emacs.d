;;; init-python.el --- xxxx
;;; Commentary:
;;; Code:

;;(use-package jedi
;;  :ensure t)

(defun my-compile ()
  "Use compile to run python programs."
  (interactive)
  (compile (concat "python3 " (buffer-name))))

(setq-default compilation-scroll-output t)

(use-package python-mode
  :ensure t
  :config
  )

;(use-package ob-ipython
;  :ensure t
;  :config)

;(use-package ob-go
;  :ensure t)


;(use-package lpy
;  :ensure t
;  :config)


;;ein notebook
;(use-package ein
;  :ensure t
;  :config
;  (add-hook 'ein:connect-mode-hook 'jedi:setup)
;  )


(setq-default ein:use-auto-complete-superpack t)

;; (use-package elpy
;;   :ensure t
;;   :init
;;   (elpy-enable))

;(use-package lsp-pyright
;  :ensure t
;  :hook (python-mode . (lambda ()
;                          (require 'lsp-pyright)
;			  (lispy-mode)
;			  (lpy-mode)
;                          (lsp))))  ; or lsp-deferred

;; (use-package lsp-python-ms
;;   :ensure t
;;   :hook (python-mode . (lambda ()
;;                           (require 'lsp-python-ms)
;; 			  (lispy-mode)
;; 			  (lpy-mode)
;;                           (lsp))))

;; (setq lsp-python-ms-executable
;;       "~/code/python/python-language-server/output/bin/Release/Microsoft.Python.LanguageServer")
    

;(setq lispy-key-theme '(c-digit))
;(lispy-set-key-theme lispy-key-theme)


(setq python-shell-interpreter "ipython")
(setq python-shell-interpreter-args "--simple-prompt -i")

;(setq lsp-python-ms-python-executable-cmd "python3")
(setq lsp-pyright-python-executable-cmd "python3")

(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))

(provide 'init-python)

;;; init-python.el ends here
