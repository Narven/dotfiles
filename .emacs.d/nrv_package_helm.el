;;;;;;;;;;;;;;;;;; Helm
(ido-mode -1)
(use-package helm
  :ensure t
  :demand t
  :bind (("M-1" . helm-M-x)
	 ("M-2" . helm-mini)
	 ("M-6" . helm-show-kill-ring)
	 ("M-7" . helm-occur)
	 ("C-x C-f" . helm-find-files)
	 ("C-x f" . helm-recent)
	 ;;("C-SPC" . helm-dabbrev)
	 ("M-y" . helm-show-kill-ring)
	 ("C-x b" . helm-buffers-list))
  :bind (:map helm-map
	      ("M-i" . helm-swoop)
	      ("M-k" . helm-next-line)
	      ("M-I" . helm-previous-page)
	      ("M-K" . helm-next-page)
	      ("M-h" . helm-beginning-of-buffer)
	      ("M-H" . helm-end-of-buffer))
  :config (progn
	    (setq helm-quick-update t) ;; do not display invisible candidates
	    (setq helm-M-x-requires-pattern nil)
	    (setq helm-ff-skip:-boring-files t)
	    (setq helm-apropos-fuzzy-match t)
	    (setq helm-autoresize-mode t)
	    (setq helm-buffers-fuzzy-matching t)
	    ;; rebind tab to run persistent action
	    (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
	    (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
	    (helm-mode 1)))
(use-package helm-gitignore
  :ensure t
  :requires helm)

(use-package helm-projectile
  :ensure t
  :requires (helm projectile))
