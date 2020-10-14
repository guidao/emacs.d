

(defun wf/init-org-mode ()
  "Init org mode."
  (general-define-key
   :states '(normal)
   :keymaps 'org-mode-map
   :prefix "SPC"
   "ii" '(org-toggle-inline-images :which-key "toggle inline image"))
  (require 'ox-reveal))



(use-package org
  :ensure t
  :config
  (add-hook 'org-mode-hook 'valign-mode)
  (add-hook 'org-mode-hook 'wf/init-org-mode)
  )

(setq org-hide-emphasis-markers t
      org-fontify-done-headline t
      org-hide-leading-stars t
      org-pretty-entities t
      org-odd-levels-only t)

(require 'deft)
(setq org-agenda-files (list deft-directory))
(setq org-default-notes-file (concat deft-directory "todo.org"))
(setq org-image-actual-width nil)
(setq org-todo-keywords
      (quote ((sequence "TODO" "|" "DONE(!)" "CANCEL(!)"))))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
	      ("CANCEL" :foreground "forest green" :weight bold)
	      ("DONE" :foreground "forest green" :weight bold))))


(require 'org-tempo)
(require 'ox-ioslide-helper)
(setq org-startup-indented t)

(use-package gkroam
  :ensure t
  :init
  (setq gkroam-root-dir "~/org/roam/")
  :bind
  (("C-c r G" . gkroam-update-all)
   ("C-c r g" . gkroam-update)
   ("C-c r d" . gkroam-daily)
   ("C-c r f" . gkroam-find)
   ("C-c r e" . gkroam-edit)
   ("C-c r n" . gkroam-smart-new)
   ("C-c r i" . gkroam-insert)
   ("C-c r I" . gkroam-index)
   ("C-c r p" . gkroam-preview)
   ("C-c r v" . gkroam-preview-current)
   ("C-c r t" . gkroam-toggle-brackets)))


(use-package org-bullets
  :custom
  (org-bullets-bullet-list '("◉" "☯" "○" "☯" "✸" "☯" "✿" "☯" "✜" "☯" "◆" "☯" "▶"))
  :hook (org-mode . org-bullets-mode))


(font-lock-add-keywords 'org-mode
                        '(("^ *\\([-]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

(font-lock-add-keywords 'org-mode
                        '(("^ *\\([+]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "◦"))))))


(setq org-plantuml-jar-path "/usr/local/Cellar/plantuml/1.2020.16/libexec/plantuml.jar")


(org-babel-do-load-languages
'org-babel-load-languages
'((ipython . t)
  (python . t)
  (go . t)
  (plantuml . t)
  ))



(provide 'init-org)
