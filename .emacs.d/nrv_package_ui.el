
;;;;;;;;;;;;;;;;;;;;;; Rainbow Move
;;;; Colorize colors as text with their value
(use-package rainbow-mode
  :ensure t
  :hook (prog-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Theme
;; doom-one, doom-vibrant, doom-dracula, doom-city-lights, doom-gruvbox
;; doom-molokai, doom-nord, doom-spacegrey
(use-package doom-themes
  :ensure t
  :init (load-theme 'doom-one))

;;(use-package nord-theme
;;  :ensure t
;;  :config
;;  (set-face-attribute 'mode-line nil
;;  :foreground "Black"
;;:background "DarkOrange"
;;  :box nil)
;;  :init (load-theme 'nord))

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(set-face-attribute 'default nil
		    :family "Hack"
		    :height 120
		    :weight 'normal
		    :width 'normal)

;; Define some margins to the main window
(set-window-margins (selected-window) 2 2)
(setq-default left-fringe-width 5)
(setq-default right-fringe-width 0)
;;(set-face-attribute 'fringe nil :background "DarkOrange")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Powerline
(use-package powerline
  :ensure t
  :config
  (powerline-default-theme))

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;; NeoTree
(use-package neotree
  :ensure t)
