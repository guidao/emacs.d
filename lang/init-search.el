
(use-package helm-swoop
  :ensure t)

(use-package rg
  :ensure t
  :config
  (general-define-key
   :states 'normal
   :prefix "SPC"
   "/" '(rg :which-key "search rg")
   "ss" '(helm-swoop :which-key "helm swoop search")
   "sd" '(rg-dwim :which-key "rg search dwim")
   "sk" '(rg-kill-saved-searches :which-key "rg search kill save")
   "st" '(rg-literal :which-key "rg search literal")))

(provide 'init-search)
