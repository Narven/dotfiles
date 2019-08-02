;;;;;;;;;;;;;;;;;;;;;;;;;; Company
;;; Code Completion
(use-package company
  :ensure t
  :bind ("C-." . company-complete)
  :custom
  (company-begin-commands '(self-insert-command))
  (company-idle-delay .1)
  (company-minimum-prefix-length 2)
  (company-show-numbers t)
  (company-tooltip-align-annotations 't)
  (global-company-mode t)
  :config
  (bind-keys :map company-active-map
	     ("C-j" . company-select-next)
	     ("C-k" . company-select-previous)
	     ("C-d" . company-show-doc-buffer)
	     ("<tab>" . company-complete)))

;; adds company icons
;;(use-package company-box
;; :after company
;; :diminish
;; :hook (company-mode . company-box-mode))
