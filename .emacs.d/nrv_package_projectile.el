;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Projectile
;;; Manage projects

(use-package projectile
  :ensure t
  :defer t
  :bind (("M-P" . projectile-switch-open-project)
	 ("M-p" . projectile-switch-project))
  :config
  (helm-projectile-on)
  (progn
    (setq projectile-completion-system 'helm
	  projectile-switch-project-action 'helm-projectile-find-file
	  projectile-enable-caching nil)

    (setq projectile-project-search-path '("~/.emacs.d" "~/Projects/narven" "~/Projects/connido" "~/Projects/eunice" "~/Projects/other" "~/Projects/narventek"))
    (setq projectile-globally-ignored-directories (append '(
							    ".git"
							    ".svn"
							    "node_modules"
							    )))
    (setq projectile-globally-ignored-files (append '(
						      ".DS_Store"
						      "*.gz"
						      "*.pyc"
						      "*.jar")))
    )
  :init
  (projectile-global-mode)
  )
