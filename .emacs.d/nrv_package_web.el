;;;;;;;;;;;;;;;;;;;;;;;;;; JS
(use-package js2-mode
  :ensure t
  :hook ((js2-mode . js2-imenu-extras-mode)
	 (js2-mode . prettier-js-mode))
  :mode "\\.js\\'"
  :custom (js-indent-level 2))

(use-package js2-refactor
  :ensure t
  :bind (:map js2-mode-map
	      ("C-k" . js2r-kill)
	      ("M-." . nil))
  :hook ((js2-mode . js2-refactor-mode)
	 (js2-mode . (lambda ()
		       (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t))))
  :config (js2r-add-keybindings-with-prefix "C-c C-r"))

;;;;;;;;;;;;;;;;;;;;;;;;;;; Web
(use-package web-mode
  :ensure t
  :mode (("\\.html?\\'" . web-mode)
	 ("\\.jsx\\'" . web-mode)
	 ("\\.tsx\\'" . web-mode))
  :custom
  (web-mode-attr-indent-offset 2)
  (web-mode-block-padding 2)
  (web-mode-css-indent-offset 2)
  (web-mode-code-indent-offset 2)
  (web-mode-comment-style 2)
  (web-mode-enable-current-element-highlight t)
  (web-mode-markup-indent-offset 2)
  (setq js-indent-level 2))



;;;;;;;;;;;;;;;;;;;;;;;;;;; jump definitions
(use-package xref-js2
  :ensure t)

;;;;;;;;;;;;;;;;;;;;;;;;;; Prettier (JS)
(use-package prettier-js
  :ensure t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;; RestClient
(use-package restclient
  :ensure t)
