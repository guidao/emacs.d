
(use-package org
  :ensure t)

(setq org-agenda-files (list deft-directory))
(setq org-default-notes-file (concat deft-directory "todo.org"))
(setq org-image-actual-width nil)
(setq org-todo-keywords
      (quote ((sequence "TODO" "|" "CANCEL" "DONE"))))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
	      ("CANCEL" :foreground "forest green" :weight bold)
	      ("DONE" :foreground "forest green" :weight bold))))


(require 'org-tempo)

;; (use-package evil-org
;;   :ensure t
;;   :after org
;;   :config
;;   (add-hook 'org-mode-hook 'evil-org-mode)
;;   (add-hook 'evil-org-mode-hook
;;             (lambda ()
;;               (evil-org-set-key-theme)))
;;   (require 'evil-org-agenda)
;;   (evil-org-agenda-set-keys))

(provide 'init-org)
