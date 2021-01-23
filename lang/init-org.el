

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

(setq org-hide-emphasis-markers nil
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
  :quelpa (gkroam :fetcher github :repo "Kinneyzhang/gkroam")
  :hook (after-init . gkroam-mode)
  :init
  (setq gkroam-root-dir "~/org/roam/")
  (setq gkroam-prettify-page-p t
        gkroam-show-brackets-p t
        gkroam-use-default-filename t
        gkroam-window-margin 0)
  :bind
  (:map gkroam-mode-map
        (("C-c r I" . gkroam-index)
         ("C-c r d" . gkroam-daily)
         ("C-c r f" . gkroam-find)
         ("C-c r i" . gkroam-insert)
         ("C-c r c" . gkroam-capture)
         ("C-c r e" . gkroam-link-edit)
         ("C-c r n" . gkroam-smart-new)
         ("C-c r p" . gkroam-toggle-prettify)
         ("C-c r t" . gkroam-toggle-brackets)
         ("C-c r R" . gkroam-rebuild-caches)
         ("C-c r g" . gkroam-update))))


(use-package org-ql
  :quelpa (org-ql :fetcher github :repo "alphapapa/org-ql"))



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


(setq org-html-head-include-default-style nil)

(setq org-html-scripts "")

(setq org-publish-project-alist
        '(
          ;; ... add all the components here (see below)...
          ("org-notes"
           :base-directory "~/code/github/guidao.github.io/org/" ;org文件的目录
           :base-extension "org" ;扩展名
           :publishing-directory "~/code/github/guidao.github.io/" ;导出目录
           :html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"./css/org-css.css\"/>";自定义样式
	   :html-head-extra "<link rel=\"stylesheet\" type=\"text/css\" href=\"https://unpkg.com/gitalk/dist/gitalk.css\"/> <script src=\"https://unpkg.com/gitalk/dist/gitalk.min.js\"></script>"
	   :html-postamble "<div id=\"gitalk\" /> <script> var gitalk = new Gitalk({
  clientID: 'f30e66bb5ab9089aa742',
  clientSecret: '5d256d445447bd4db16540c2aab0e0884218ed12',
  repo: 'guidao.github.io',
  owner: 'guidao',
  admin: ['guidao'],
  id: location.pathname,      // Ensure uniqueness and length less than 50
  distractionFreeMode: false  // Facebook-like distraction free mode
})
gitalk.render('gitalk') </script>" 
           :recursive t
           :publishing-function org-html-publish-to-html
           :headline-levels 4             ; Just the default for this project.
           :auto-preamble t
           :timestamp nil
           :author nil
           )
          ("org" :components ("org-notes"))
          ))

(setq org-html-validation-link nil) ; 去掉validation显示
(setq org-html-link-home "index.html"); 设置home超链接
(setq org-html-link-up "index.html")

(provide 'init-org)
