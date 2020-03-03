;;; init-elisp.el --- xxxx
;;; Commentary:
;;; Code:
(use-package elisp-slime-nav
  :ensure t
  :config
  (dolist (hook '(emacs-lisp-mode-hook ielm-mode-hook))
    (add-hook hook 'turn-on-elisp-slime-nav-mode))
  (add-hook 'elisp-slime-nav-mode-hook 'init-elisp-hook)
  )

(defun init-elisp-hook ()
  (general-define-key
   :states 'normal
   :keymaps 'local
   :prefix "SPC"
   "mgg" '(elisp-slime-nav-find-elisp-thing-at-point :which-key "slime nav goto define")
   )
  )


(provide 'init-elisp)

;;; init-elisp.el ends here
