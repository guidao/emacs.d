;;; init-search.el --- xxxx
;;; Commentary:
;;; Code:

;; (use-package helm-swoop
;;   :ensure t)

;; (setq helm-swoop-pre-input-function (lambda () nil))


(use-package rg
  :ensure t
  :config
  (general-define-key
   :states 'normal
   :prefix "SPC"
   "/" '(rg :which-key "search rg")
   "ss" '(swiper :which-key "swiper search")
   "sd" '(rg-dwim :which-key "rg search dwim")
   "sk" '(rg-kill-saved-searches :which-key "rg search kill save")
   "st" '(rg-literal :which-key "rg search literal")))


(provide 'init-search)

;;; init-search.el ends here
