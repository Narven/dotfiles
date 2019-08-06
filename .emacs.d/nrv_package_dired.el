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
  :ensure t
  :commands (dired-ranger-copy dired-ranger-paste dired-ranger-move)
  :bind (:map dired-mode-map
	      ("W" . dired-ranger-copy)
	      ("X" . dired-ranger-move)
	      ("Y" . dired-ranger-paste)))
