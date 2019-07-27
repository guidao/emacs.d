

(provide 'init-python)

(use-package jedi
  :ensure t)

(defun my-compile ()
  "Use compile to run python programs"
  (interactive)
  (compile (concat "python3 " (buffer-name))))

(setq compilation-scroll-output t)


(use-package python-mode
  :ensure t
  :config
  )

(use-package ob-ipython
  :ensure t
  :config)



;;ein notebook
(use-package ein
  :ensure t
  :config
  (add-hook 'ein:connect-mode-hook 'jedi:setup)
  )


(setq ein:use-auto-complete-superpack t)

(use-package elpy
  :ensure t
  :init
  (elpy-enable))

(define-key elpy-mode-map (kbd "C-c C-c") 'my-compile)

;; (use-package function-args
;;   :ensure t)

;; (use-package lispy
;;   :ensure t)

;; (setq
;;  python-shell-interpreter "ipython"
;;  python-shell-interpreter-args "--pylab"
;;  python-shell-prompt-regexp "In \\[[0-9]+\\]: "
;;  python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
;;  python-shell-completion-setup-code
;;  "from IPython.core.completerlib import module_completion"
;;  python-shell-completion-module-string-code
;;  "';'.join(module_completion('''%s'''))\n"
;;  python-shell-completion-string-code
;;  "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")

(jedi:setup)
;; (setq python-shell-interpreter "python3"
;;       python-shell-interpreter-args "")


;(require 'lpy)

