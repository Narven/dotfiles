;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Magit
;;;  GIT manager

(use-package magit
  :ensure t
  :bind (("M-4" . magit-status))
  :when (executable-find "git")
  :config
  (progn
    (setq magit-push-always-verify nil)
    (setq git-commit-summary-max-length 70)
    (setq magit-push-current-set-remote-if-missing nil)
    (define-key magit-mode-map (kbd "<tab>") 'magit-section-toggle))
  :custom
  (magit-completing-read-function #'ivy-completing-read)
  (magit-diff-refine-hunk 'all))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Git Gutter
;;; https://github.com/syohex/emacs-git-gutter

(use-package git-gutter
  :ensure t
  :diminish
  :custom
  (git-gutter:window-width 4)
  ;;(git-gutter:visual-line t)
  (git-gutter:handled-backends '(git hg bzr svn))
  :init (global-git-gutter-mode +1))

(use-package git-timemachine
  :ensure t)
