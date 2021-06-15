;;; Code: 


(require 'ts)


(use-package org
  :ensure t
  :config
  ;; 笔记管理
  (use-package deft
    :ensure t
    :config
    (setq deft-extensions '("org" "txt" "md" "markdown" "text"))
    (setq deft-default-extension "org"))

  (use-package valign
    :ensure t
    :config
    (add-hook 'org-mode-hook 'valign-mode))
  
  ;; 设置图片宽度为屏幕的三分之一
  (setq org-image-actual-width (list (/ (display-pixel-width) 3)))
  (setq org-hide-emphasis-markers nil
      org-fontify-done-headline t
      org-hide-leading-stars t
      org-pretty-entities nil
      org-odd-levels-only nil)
  
  (setq org-startup-indented t)
  (setq org-default-notes-file (concat deft-directory "todo.org"))
  (setq org-agenda-files `("~/org/wiki" "~/org/wiki/daily" ,deft-directory))
  (setq org-refile-use-outline-path 'file)
  (setq org-outline-path-complete-in-steps nil)
  (setq org-refile-allow-creating-parent-nodes 'confirm)
  (setq org-refile-targets '((org-agenda-files :maxlevel . 3))))



(setq org-todo-keywords
      (quote ((sequence "TODO" "|" "DONE(!)" "CANCEL(!)"))))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
	      ("CANCEL" :foreground "forest green" :weight bold)
	      ("DONE" :foreground "forest green" :weight bold))))





(require 'org-tempo)

(use-package ox-reveal :ensure t)


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


;; (defun format-timestamp (format str)
;;   (message "%s" str)
;;   "0000"
;;   )


;; (font-lock-add-keywords 'org-mode
;;                         '(("\\[timestamp:\\(.*\\)\\]"
;;                            (0
;; 			    (prog1 ()
;; 			      (compose-region (match-beginning 1) (match-end 1) "hello"))))))





(setq org-plantuml-jar-path "/usr/local/Cellar/plantuml/1.2020.16/libexec/plantuml.jar")

(use-package ein
  :ensure t
  :quelpa (ein :fetcher github :repo "millejoh/emacs-ipython-notebook" :files ("lisp/*"))
  )

(org-babel-do-load-languages
'org-babel-load-languages
'(
  (ein . t)
  ;;(ipython . t)
  (python . t)
  ;(go . t)
  ;(plantuml . t)
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
	   :html-head-extra "<link rel=\"stylesheet\" type=\"text/css\" href=\"./css/gitalk.css\"/> <script src=\"./js/gitalk.min.js\"></script>"
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


(use-package org-roam
      :ensure t
      :quelpa (org-roam :fetcher github :repo "org-roam/org-roam")
      :hook
      (after-init . org-roam-mode)
      :custom
      (org-roam-directory "~/org/wiki")
      :bind (:map org-roam-mode-map
              (("C-c n l" . org-roam)
               ("C-c n f" . org-roam-find-file)
               ("C-c n g" . org-roam-graph))
              :map org-mode-map
              (("C-c n i" . org-roam-insert))
              (("C-c n I" . org-roam-insert-immediate))))


(setq org-capture-templates
      '(("t" "todo" plain (file "~/.deft/todo.org")
         "* TODO %?\n%U\n" :clock-in t :clock-resume t)))

(defun my/smart-capture-task ()
  "Capture a task."
  (interactive)
  (org-capture nil "t"))



(defconst my/agenda-cmd-refile
  '(tags
    "REFILE"
    ((org-agenda-overriding-header "To refile")
     (org-tags-match-list-sublevels nil))))

(defconst my/agenda-cmd-today
  '(agenda
    ""
    ((org-agenda-span 'week)
     (org-agenda-sorting-strategy '(habit-down
                                    time-up
                                    category-keep
                                    todo-state-down
                                    priority-down)))))


(setq org-agenda-custom-commands
      `((" " "Agenda for capture todo"
	 (,my/agenda-cmd-refile
	  ,my/agenda-cmd-today)
	 )))

(use-package org-ql
  :ensure t
  :quelpa (org-ql :fetcher github :repo "alphapapa/org-ql"
            :files (:defaults (:exclude "helm-org-ql.el"))))

(setq org-super-agenda-groups
      '((:name "待排期"
	       :time-grid t
	       :tag "REFILE")
	(:name "待办"
	       :time-grid t
	       :and (:todo "TODO" :not (:tag "suspend")))
	(:name "已完成"
	       :time-grid t
	       :todo "DONE")
	(:name "已取消"
	       :time-grid t
	       :todo "CANCEL")
	(:name "挂起"
	       :time-grid t
	       :todo "TODO"
	       :tag "suspend")))

(defun my/this-week-item ()
  (interactive)
  (let* ((ts (ts-now))
         (beg-of-week (->> ts
                           (ts-adjust 'day (- (ts-dow (ts-now))))
                           (ts-apply :hour 0 :minute 0 :second 0)))
         (end-of-week (->> ts
                           (ts-adjust 'day (- 6 (ts-dow (ts-now))))
                           (ts-apply :hour 23 :minute 59 :second 59))))
    (org-ql-search (org-agenda-files)
      `(or (and (ts :from ,beg-of-week :to ,end-of-week) (todo "DONE" "CANCEL")) (todo "TODO"))
      :title "This week"
      :super-groups 'org-super-agenda-groups
      :sort '(priority date))))


(use-package ox-gfm
  :ensure t)

(provide 'init-org)
