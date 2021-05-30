;;; init-meow.el -- meow keybinding

(require 'misc)

(global-set-key (kbd "ESC u") nil)


(defun my/smart-kill-region (_arg)
  (interactive "P")
  (if (region-active-p) (meow-kill _arg)
    (kill-forward-chars 1)))

(defun my/smart-agenda-todo ()
  (interactive)
  (org-agenda "" " "))

(defun my/smart-cancel ()
  (interactive)
  (if (region-active-p) (meow-cancel)))

(defun my/smart-vim-command (arg)
  (interactive "s:")
  (cond ((equal arg "w") (save-buffer))
	((equal arg "wq") (save-buffers-kill-terminal))
	((not (equal (string-to-number arg) 0))
	 (meow-goto-line (string-to-number arg)))))

(defvar meow-leaving-insert-mode-hook nil
    "Hook to run when leaving meow insert mode.")
(defvar meow-entering-insert-mode-hook nil
    "Hook to run when entering meow insert mode.")
(add-hook 'meow-insert-mode-hook
            (lambda ()
              (unless meow-insert-mode 
                (run-hooks 'meow-leaving-insert-mode-hook))))
(add-hook 'meow-insert-mode-hook
            (lambda ()
              (if meow-insert-mode 
                  (run-hooks 'meow-entering-insert-mode-hook))))
(with-eval-after-load 'sis
    (add-hook 'meow-leaving-insert-mode-hook #'sis-set-english)
    (add-to-list 'sis-context-hooks 'meow-entering-insert-mode-hook))

(defun meow-setup ()
  (setq meow-cheatsheet-layout meow-cheatsheet-layout-qwerty)
  (meow-motion-overwrite-define-key
   '("j" . meow-next)
   '("k" . meow-prev))
  (meow-leader-define-key
   ;; SPC j/k will run the original command in MOTION state.
   '("j" . meow-motion-origin-command)
   '("k" . meow-motion-origin-command)
   '("TAB" . meow-last-buffer)
   '("SPC" . counsel-M-x)
   '("bb" . ivy-switch-buffer)
   '("ff" . counsel-find-file)
   '("pf" . counsel-projectile-find-file)
   '("pg" . counsel-projectile-rg)
   '("ww" . other-window)
   '("ss" . swiper)
   '("wx" . delete-window)
   '("oa" . org-agenda)
   '("oo" . my/this-week-item)
   '("oc" . my/smart-capture-task)
   '("at" . vterm)
   ;; Use SPC (0-9) for digit arguments.
   '("1" . meow-digit-argument)
   '("2" . meow-digit-argument)
   '("3" . meow-digit-argument)
   '("4" . meow-digit-argument)
   '("5" . meow-digit-argument)
   '("6" . meow-digit-argument)
   '("7" . meow-digit-argument)
   '("8" . meow-digit-argument)
   '("9" . meow-digit-argument)
   '("0" . meow-digit-argument)
   '("/" . meow-keypad-describe-key)
   '("?" . meow-cheatsheet))
  (meow-normal-define-key
   '("C-o" . pop-global-mark)
   '(":" . my/smart-vim-command)
   '("gg" . meow-begin-of-buffer)
   '("gc" . avy-goto-char)
   '("gl" . avy-goto-line)
   '("gd" . xref-find-definitions)
   '("ga" . beginning-of-defun)
   '("ge" . end-of-defun)
   '("0" . meow-expand-0)
   '("9" . meow-expand-9)
   '("8" . meow-expand-8)
   '("7" . meow-expand-7)
   '("6" . meow-expand-6)
   '("5" . meow-expand-5)
   '("4" . meow-expand-4)
   '("3" . meow-expand-3)
   '("2" . meow-expand-2)
   '("1" . meow-expand-1)
   '("-" . negative-argument)
   '(";" . meow-reverse)
   '("," . meow-inner-of-thing)
   '("." . meow-bounds-of-thing)
   '("[" . meow-beginning-of-thing)
   '("]" . meow-end-of-thing)
   '("a" . meow-append)
   ;;'("A" . meow-open-below)
   '("b" . meow-back-word)
   '("B" . meow-back-symbol)
   '("c" . meow-change)
   '("C" . meow-change-save)
   '("dd" . meow-kill-whole-line)
   '("D" . meow-backward-delete)
   '("e" . meow-block)
   '("E" . meow-next-symbol)
   '("f" . meow-find-expand)
   '("F" . meow-find)
   '("q" . my/smart-cancel)
   '("G" . meow-grab)
   '("h" . meow-left)
   '("H" . meow-left-expand)
   '("i" . meow-insert)
   '("I" . meow-open-above)
   '("j" . meow-next)
   '("J" . meow-next-expand)
   '("k" . meow-prev)
   '("K" . meow-prev-expand)
   '("l" . meow-right)
   '("L" . meow-right-expand)
   '("m" . meow-join)
   '("n" . meow-search)
   '("N" . meow-pop-search)
   '("o" . meow-open-below)
   '("O" . meow-block-expand)
   '("p" . meow-yank)
   '("P" . meow-yank-pop)
   ;;'("q" . meow-quit)
   '("Q" . meow-goto-line)
   '("r" . meow-replace)
   '("R" . meow-swap-grab)
   '("s" . meow-kill)
   '("t" . meow-till)
   '("T" . meow-till-expand)
   '("u" . meow-undo)
   '("U" . meow-undo-in-selection)
   '("v" . meow-visit)
   '("V" . meow-kmacro-matches)
   '("w" . meow-next-word)
   '("W" . meow-mark-symbol)
   '("x" . my/smart-kill-region)
   '("X" . meow-kmacro-lines)
   '("y" . meow-save)
   '("Y" . meow-sync-grab)
   '("z" . meow-pop-selection)
   '("Z" . meow-pop-all-selection)
   '("&" . meow-query-replace)
   '("%" . meow-query-replace-regexp)
   '("'" . repeat)
   '("\\" . quoted-insert)
   ;;'("<escape>" . meow-last-buffer)
   ))


(use-package meow
  :ensure t
  :demand t
  :init
  (meow-global-mode 1)
  :config
  ;; meow-setup 用于自定义按键绑定，可以直接使用下文中的示例
  (setq meow-use-clipboard t)
  (meow-setup)
  ;; 如果你需要在 NORMAL 下使用相对行号（基于 display-line-numbers-mode）
  ;;(meow-setup-line-number)
  ;; 如果你需要自动的 mode-line 设置（如果需要自定义见下文对 `meow-indicator' 说明）
  ;;(meow-setup-indicator)
  )


(provide 'init-meow)
;;; init-meow end of here
