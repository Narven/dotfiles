;;;;;;;;;;;;;;;;;;;;;;;;;;;; YAML

(use-package yaml-mode
  :ensure t
  :delight yaml-mode "ψ"
  :mode "\\.yml\\'"
  :interpreter ("yml" . yml-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;; SASS
(use-package sass-mode
  :ensure t)

;;;;;;;;;;;;;;;;;;;;;;;;;;; CSV
(use-package csv-mode
  :ensure t)

;;;;;;;;;;;;;;;;;;;;;;;;;;; Emacs Lisp
(use-package elisp-mode
  :ensure nil
  :delight emacs-lisp-mode "ξ")

;;;;;;;;;;;;;;;;;;;;;;;;; SQL Mode
(use-package sql-indent
  :ensure t
  :delight sql-mode "Σ"
  :mode "\\.sql\\'"
  :interpreter ("sql" . sql-mode))


;;;;;;;;;;;;;;;;;;;;;;;; VUE
(use-package vue-mode
  :ensure t
  :delight vue-mode "V"
  :mode "\\.vue\\'"
  :hook (vue-mode . prettier-js-mode)
  :custom
  (mmm-submode-decoration-level 0)
  (vue-html-extra-indent 2))

;;;;;;;;;;;;;;;;;;;;; Python
(use-package python-mode
  :ensure t
  :custom
  (py-force-py-shell-name t)
  (py-smart-identation t))

;;;;;;;;;;;;;;;;;;;;;;;;;;;; JSON
(use-package json-mode
  :ensure t
  :delight json-mode "J"
  :mode "\\.json\\'"
  :hook (before-save . my-json-mode-before-save-hook)
  :preface
  (defun my-json-mode-before-save-hook ()
    (when (eq major-mode 'json-mode)
      (json-pretty-print-buffer-ordered)))
  :config
  (progn
    (setq json-reformat:indent-width 2)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;; CSS
(use-package css-mode
  :ensure t
  :custom (css-indent-offset 2))

;;;;;;;;;;;;;;;;;;;;;;;;;;;; Elixir

(use-package alchemist
  :ensure t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;; Gettext (PO Files)

(use-package po-mode
  :ensure t
  :mode ("\\.po?\\'" . po-mode)
  :commands (po-mode))

;;;;;;;;;;;;;;;;;;;;;;;;; PlantUML
(use-package plantuml-mode
  :ensure t)

;;;;;;;;;;;;;;;;;;;; YARN
(use-package yarn-mode
  :ensure t
  :delight yarn-mode "Y")


;;;;;;;;;;;;;;;;;;;;;; Editorconfig
(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1)
  :init
  (add-hook 'prog-mode-hook (editorconfig-mode 1))
  (add-hook 'text-mode-hook (editorconfig-mode 1)))

;;;;;;;;;;;;;;;;;;;;;;;; Markdown
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (
	 ("\\.md\\'" . markdown-mode)
	 ("README\\.mod\\'" . gfm-mode)
	 ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Emmet
(use-package emmet-mode
  :ensure t
  :hook (sgml-mode css-mode web-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Terraform
;; Managing/Orquestrating Infrastructure
(use-package terraform-mode
  :ensure t
  :init (setq terraform-indent-level 2))
