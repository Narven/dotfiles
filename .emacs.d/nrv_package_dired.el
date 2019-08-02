;;;;;;;;;;;;;;;;;;;;;;;;;;;; Dired
;;; File explorer

(use-package dired
  :ensure nil
  :delight dired-mode "Dired"
  :custom
  (dired-dwim-target t)
  (dired-hide-details-hide-symlink-targets nil)
  (dired-listing-switches "-alh")
  (dired-recursive-copies 'always)
  (dired-recursive-deletes 'always)
  (dired-auto-revert-buffer t)
  (dired-ls-F-marks-symlinks nil))

(use-package dired-ranger
  :commands (dired-ranger-copy dired-ranger-paste dired-ranger-move)
  :init
  (add-hook 'dired-mode-hook
	    (lambda()
	      (define-key dired-mode-map (kbd "M-w") 'dired-ranger-copy)
	      (define-key dired-mode-map (kbd "C-y") 'dired-ranger-paste)
	      (define-key dired-mode-map (kbd "C-c C-y") 'dired-ranger-move))))

;;     (use-package dired-x
;;     :ensure t
;;       :requires dired
;;       :after dired
;;       :preface
;;       (defun my/dired-revert-after-cmd (command &optional output error)
;;	 (revert-buffer))
;;       :config (advice-add 'dired-smart-shell-command :after #'my/dired-revert-after-cmd))
