
(use-package org
  :ensure t)

(require 'deft)
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
(require 'ox-ioslide-helper)
(setq org-startup-indented t)

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(provide 'init-org)
