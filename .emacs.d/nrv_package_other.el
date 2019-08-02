;;;;;;;;;;;;;;;;;;;;;; Lorem Ipsum
(use-package lorem-ipsum
  :ensure t
  :bind (("C-c C-v l" . lorem-ipsum-insert-list)
	 ("C-c C-v p" . lorem-ipsum-insert-paragraphs)
	 ("C-c C-v s" . lorem-ipsum-insert-sentences)))


;;;;;;;;;;;;;;;;;;; EYEBROWSE
;;;  Manage Workspaces (this is not working the meta shortcuts dont seem to work)
(use-package eyebrowse
  :ensure t
  :diminish eyebrowse-mode
  :config (progn
	    (define-key eyebrowse-mode-map (kbd "M-S-1") 'eyebrowse-switch-to-window-config-1)
	    (define-key eyebrowse-mode-map (kbd "M-S-2") 'eyebrowse-switch-to-window-config-2)
	    (define-key eyebrowse-mode-map (kbd "M-S-3") 'eyebrowse-switch-to-window-config-3)
	    (define-key eyebrowse-mode-map (kbd "M-S-4") 'eyebrowse-switch-to-window-config-4)
	    (eyebrowse-mode t)
	    (setq eyebrowse-new-workspace t)))


;;;;;;;;;;;;;;;;;; EWW
;;; Web Browser
(use-package eww
  :ensure t)
(use-package eww-lnum
  :ensure t
  :requires eww
  :after eww)

;;;;;;;;;;;;;;;;;; TRRY
;;; Allows to try packages
(use-package try
  :ensure t)


;;;;;;;;;;;;;;;;;; WHICH KEY
;;; Shortcut key helper
(use-package which-key
  :ensure t
  :config (which-key-mode))


;;;;;;;;;;;;;;;;;;;;; Hungry Delete
(use-package hungry-delete
  :ensure t
  :diminish
  :config
  (global-hungry-delete-mode))

;;;;;;;;;;;;;;;;;;;;; Wttrin
;;; Weather
(use-package wttrin
  :ensure t
  :commands (wttrin)
  :init
  (setq wttrin-default-cities '("Feltham"
				"London",
				"Lisbon")))

;;;;;;;;;;;;;;;;;;;;; Powerline
(use-package powerline
  :ensure t)

(use-package multi-term
  :ensure t)


;;;;;;;;;;;;;;;;;;;;;;;;;;; SavePlace
;;; Opens a file in the last known location
;;; [[https://www.emacswiki.org/emacs/SavePlace][SavePlace]]
(use-package saveplace
  :ensure t)

;;;;;;;;;;;;;;;;;;;;;;;;;;; Docker
(use-package dockerfile-mode
  :ensure t
  :delight dockerfile-mode "δ"
  :mode "Dockerfile\\'")


;;;;;;;;;;;;;;;;;;;;;;; Alert
(use-package alert
  :ensure t
  :custom
  (alert-default-style 'libnotify))

;;;;;;;;;;;;;;;;;;;;;; AutoRevert
;;; Avoids call to the function or reload Emacs
(use-package autorevert
  :ensure nil
  :diminish auto-revert-mode
  :bind ("C-x R" . revert-buffer)
  :custom (auto-revert-verbose nil)
  :config (global-auto-revert-mode 1))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Emacs Server
(use-package server
  :ensure t
  :init
  (server-mode 1)
  :config
  (unless (server-running-p)
    (server-start)))
