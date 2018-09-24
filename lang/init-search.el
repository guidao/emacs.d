

(use-package rg
  :ensure t
  :config
  (general-define-key
   :states 'normal
   :prefix "SPC"
   "ss" '(rg :which-key "search rg")
   "sd" '(rg-dwim :which-key "rg search dwim")
   "sk" '(rg-kill-saved-searches :which-key "rg search kill save")
   "st" '(rg-literal :which-key "rg search literal")))

(provide 'init-search)
