(defvar ov nil)

(defun m-set-overlay ()
    (interactive)
    (if (use-region-p)
	(progn
	(setq ov (make-overlay (region-beginning) (region-end)))
	(deactivate-mark)
	;;(overlay-put ov 'face 'italic)
	  )
	(error "not active region")))

(defun m-overlay-beginning ()
  (if (null ov)
      (error "overlay is not set"))
  (overlay-start ov))

(defun m-get-overlay ()
  (if (null ov)
      (error "overlay is not set")
    ov)
  )

(defun m-overlay-run (f)
  (delete-overlay ov)
  )


  (general-define-key
   :states 'normal
   :keymaps 'local
   :prefix "SPC"
   "mr" '(push-region :which-key "push region")
   )

(defun replace-buffer-substring (start end str)
  "replace buffer substring"
  (kill-region start end)
  (save-excursion
    (goto-char start)
    (insert str)
    )
  )

(provide 'init-region)

