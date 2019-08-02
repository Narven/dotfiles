
;;;;;;;;;;;;;;;;;;;;;; Rainbow Move
;;;; Colorize colors as text with their value
(use-package rainbow-mode
  :ensure t
  :hook (prog-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Theme
(use-package nimbus-theme
  :ensure t
  :init (load-theme 'nimbus))

(set-face-attribute 'default nil
		    :family "Source Code Pro"
		    :height 130
		    :weight 'normal
		    :width 'normal)

(use-package smart-mode-line
  :ensure t
  :config (sml/setup))


;;;;;;;;;;;;;;;;;;;;;;;;;;;; Time
(use-package time
  :ensure nil
  :custom
  (display-time-24hr-format t)
  (display-time-load-average-threshold 1.5))

;;;;;;;;;;;;;;;;;;;;;;; Aggressive Indent
(use-package aggressive-indent
  :ensure t
  :hook ((css-mode . aggressive-indent-mode)
	 (emacs-lisp-mode . aggressive-indent-mode)
	 (js-mode . aggressive-indent-mode)
	 (lisp-mode . aggressive-indent-mode))
  :custom (aggressive-indent-comments-too))

;;;;;;;;;;;;;;;;;;;;;;;;; Rainbow Delimiters
(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

;;;;;;;;;;;;;;;;;;;;;;;;; SmartParens
(use-package smartparens
  :ensure t
  :config (smartparens-global-mode 1))

;;;;;;;;;;;;;;;;;;;;; Beacon
;;; Better display the cursor
(use-package beacon
  :ensure t
  :config
  (beacon-mode t))


;;;;;;;;;;;;;;;;;;;; Better Shell
(use-package shell-pop
  :ensure t
  :config
  (progn
    (shell-pop-full-span t)
    (shell-pop-shell-type (quote ("ansi-term" "*ansi-term*" (lambda nil (ansi-term shell-pop-term-shell)))))
    (shell-pop-term-shell "/usr/bin/zsh")))


;;;;;;;;;;;;;;;;;;;;;;;;; Smooth Scrolling
;;; Better scrolling
(use-package smooth-scrolling
  :ensure t
  :config
  (setq smooth-scroll-margin 3))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Highlight current line
(use-package highlight-current-line
  :ensure t
  :config
  (highlight-current-line-globally t)
  (highlight-current-line-high-faces nil)
  (highlight-current-line-whole-line nil)
  (h-line-face (quote highlight)))
