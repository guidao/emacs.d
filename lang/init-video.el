;;; init-video.el --- xxxx
;;; Commentary:
;;; Code:


(use-package emms
  :ensure t
  :config
  (emms-standard))

(require 'emms-setup)
(emms-standard)
(emms-default-players)


(provide 'init-video)

;;; init-video.el ends here


