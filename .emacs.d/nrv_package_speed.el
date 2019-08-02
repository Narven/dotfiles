;;;;;;;;;;;;;;;;;;;;;; Move Text
(use-package move-text
  :ensure t
  :bind (("M-S-p" . move-text-up)
	 ("M-S-n" . move-text-down))
  :config (move-text-default-bindings))

;;;;;;;;;;;;;;;;;;;;;;;;;;;; Multiple Cursors
;;; Having multiple cursors enabled

(use-package multiple-cursors
  :ensure t
  :general
  ("C-c l" 'mc/edit-lines
   "M-»"   'mc/mark-next-like-this
   "M-«"   'mc/mark-previous-like-this
   "C-M-»" 'mc/mark-all-like-this
   "M-<mouse-1>" 'mc/add-cursor-on-click))


;;;;;;;;;;;;;;;;;;;;; AVY (JUMP)
(use-package avy
  :ensure t
  :bind ("M-s" . avy-goto-char)
  :init (setq avy-background t)
  )

;;;;;;;;;;;;;;;;; ACE WINDOW
;;; Window state management
;;; replaces the [CTRL+x o] that changes window to use numeric switch
;;; progn is the same has :config but allows more than one line of config
(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key [remap other-window] 'ace-window)
    (custom-set-faces
     '(aw-leading-char-face
       ((t (:inherit ace-jump-face-foreground :height 2.0)))))
    ))

;;;;;;;;;;;;;;;;;; Swipper
;;; Improved Search
(use-package swiper
  :ensure t
  :config
  :bind(
	("C-s" . swiper) ;; better search
	("C-r" . swiper)
	("C-c C-r" . ivy-resume)))

;;;;;;;;;;;;;;;;; Auto Complete
(use-package auto-complete
  :ensure t
  :demand
  ;;:bind(
  ;;     ("C-n" . ac-next)
  ;;     ("C-p" . ac-previous)
  ;;      )
  :init
  (progn
    (ac-config-default)
    (setq ac-auto-show-menu 0.1
	  ac-menu-height 20)

    (global-auto-complete-mode t)))

;;;;;;;;;;;;;;;;;; Yasnippet
;;; Snippets templates
(use-package yasnippet
  :ensure t
  :config
  (use-package yasnippet-snippets
    :ensure t)
  (yas-reload-all))

;;;;;;;;;;;;;;;;;;;;; Switch Window
;;; Displays an overlay in each window showing a unique key,
;;; then asks the user where to move in the window.
(use-package switch-window
  :ensure t
  :bind (("C-x o" . switch-window)
	 ("C-x w" . switch-window-then-swap-buffer)))


;;;;;;;;;;;;;;;;;;;;; Expand Region
;;; Increase region by semantic units. It tries to be
;;; smart about it and adapt to the structure of the current major mode.
(use-package expand-region
  :ensure t
  :bind (("C-+" . er/contract-region)
	 ("C-=" . er/expand-region)))

;;;;;;;;;;;;;;;;;;;;;;;;;; FlySpell
;;; Spell checking
(use-package flyspell
  :ensure t
  :custom
  (flyspell-abbrev-p t)
  (flyspell-issue-message-flag nil)
  (flyspell-issue-welcome-flag nil)
  (flyspell-mode 1))

(use-package flyspell-correct-ivy
  :requires flyspell
  :after flyspell
  :bind (:map flyspell-mode-map
	      ("C-;" . flyspell-correct-word-generic))
  :custom (flyspell-correct-interface 'flyspell-correct-ivy))

(use-package ispell
  :custom
  (ispell-silently-savep t))

;;;;;;;;;;;;;;;;;;;;; Undo Tree
;;; Better undos
;;;  CTRL+/ Undo
;;;  CTRL+? Redo
;;;  CTRL+x u Undo Tree
(use-package undo-tree
  :ensure t
  :diminish
  :bind ("C-z" . undo-tree-redo)
  :custom
  (undo-tree-visualizer-timestamps t)
  (undo-tree-visualizer-diff t))
