

(use-package elixir-mode
  :ensure t)
(use-package alchemist
  :ensure t)

(defun exs-load(dep)
  (interactive "sdep:")
  (alchemist-eval--expression ":code.add_patha('/Users/wangfeng/.exs/deps/exs-0.1.0/ebin')")
  (alchemist-eval--expression (concat "Exs.Load.load " dep))) 

(provide 'init-elixir)
