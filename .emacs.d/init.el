;;; package --- Summary
;;; Code:
;;; Commentary:

(defun nrv-get-fullpath (@file-relative-path)
  "http://ergoemacs.org/emacs/organize_your_dot_emacs.html"
  (concat (file-name-directory (or load-file-name buffer-file-name)) @file-relative-path))

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq load-prefer-newer t)

(setq-default user-full-name "Pedro Luz"
              user-mail-address "pedromsluz@gmail.com")

(require 'subr-x)
(require 'cl-lib)
(require 'package)

(setq package-archives '(("melpa" . "http://melpa.org/packages/")
			 ("melpa-stable" . "http://stable.melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "https://marmalade-repo.org/packages/")
			 ))

(setq exec-path (append exec-path '("/usr/local/go/bin")))

(setq package-enable-at-startup nil)

(defconst IS-LINUX (eq system-type 'gnu/linux))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq-default use-package-always-defer t)

(use-package general :ensure
  :demand
  :config
  (defalias 'gsetq 'general-setq))

(setq multi-term-program "/usr/bin/zsh")

;;;;;;;; unset C- and M- digit keys
;;; FROM: http://pragmaticemacs.com/emacs/use-your-digits-and-a-personal-key-map-for-super-shortcuts/
(dotimes (n 10)
  (global-unset-key (kbd (format "C-%d" n)))
  (global-unset-key (kbd (format "M-%d" n)))
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;HELPERS;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun bh/switch-to-scratch ()
  (interactive)
  (switch-to-buffer "*scratch*"))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;GENERAL SETTINGS;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; keep cursor at the same position when scrolling
(setq scroll-preserve-screen-position 1)

;; prettify-symbols-mode. Its purpose is to replace the standard
;; text representation of various identifiers/symbols with a
;; (arguably) more aesthetically pleasing representation (often a
;; single unicode character would replace several ascii characters
(global-prettify-symbols-mode +1)


;; removing trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; gotta see matching parens
(show-paren-mode t)

;; saves every 20 strokes
(setq auto-save-interval 20)

;; overwrite selected text
(delete-selection-mode t)

;; disable toolbar
(tool-bar-mode 0)
;;(scroll-bar-mode -1)
(menu-bar-mode -1)

;; convert to short mode
(fset 'yes-or-no-p 'y-or-n-p)

(minibuffer-depth-indicate-mode)

;; use F5 to revert to original buffer
(global-set-key (kbd "<f5>") 'revert-buffer)

;; hide default startup message
(gsetq inhibit-startup-message t
       inhibit-startup-echo-area-message user-login-name
       inhibit-default-init t
       initial-scratch-message nil)

;; blinking cursor
(blink-cursor-mode 1)

(window-divider-mode)

;; BETTER FONT
(gsetq jit-lock-defer-time nil
       jit-lock-stealth-nice 0.2
       jit-lock-stealth-time 0.2
       jit-lock-stealth-verbose nil)

(global-linum-mode)
(linum-mode t)

;; OS SPECIFIC
(gsetq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)
       select-enable-clipboard t
       select-enable-primary t)

(setq x-gtk-use-system-tooltips nil
      x-underline-at-descent-line t)

(size-indication-mode 1)

;; accelerate the cursor when scrolling.
(load "accel" t t)

;; make selections and clipboard behave properly
(delete-selection-mode t)
(transient-mark-mode t)

;; enable clipboard
(setq select-enable-clipboard t)

;; highlight regions and add special behaviors to regions
(setq transient-mark-mode t)

;; always new line at the eof
(setq require-final-newline t)

;; follow symbolic links
(setq vc-follow-symlinks t)

;; set default browser
;; (setq browse-url-browser-function 'browse-url-default-macosx-browser)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;UI;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(gsetq initial-frame-alist '((fullscreen . fullboth))
       custom-safe-themes t
       frame-inhibit-implied-resXize t
       cursor-in-non-selected-windows nil
       highlight-non-selected-windows nil
       mode-line-default-help-echo nil
       use-dialog-box nil
       visible-cursor nil
       visible-bell nil
       auto-compression-mode t
       random t
       scroll-conservatively 1
       read-buffer-completion-ignore-case t
       sentence-end-double-space nil
       x-stretch-cursor nil ;; makes cursor width of the character is under
       pos-tip-internal-border-width 6
       pos-tip-border-width 1
       window-resize-pixelwise t
       frame-resize-pixelwise t
       echo-keystrokes 0.2
       window-divider-default-places t
       window-divider-default-bottom-width 1
       window-divider-default-right-width 1
       frame-title-format '("%b - Emacs"))

;; set memory configurations
;;    (setq gc-cons-threshold 50000000)
(setq gnutls-min-prime-bits 4096)


;; EDITOR
(gsetq tab-width 2
       indent-tabs-mode nil
       require-final-newline t
       more-require-final-newline t
       sentence-end-double-space nil
       tab-always-intent 'complete
       tabify-regexp "^\t* [ \t]+"
       word-wrap t
       fill-column 90
       truncate-lines t
       truncate-partial-width-windows 70)

;; SCROLLING
(gsetq scroll-margin 1
       hscroll-margin 2
       hscroll-step 1
       scroll-conservatively 101
       scroll-preserve-screen-position t
       mouse-wheel-scroll-amount '(1)
       mouse-wheel-progressive-speed nil)

;; prevents C-z minimize to terminal (fg to restore)
(bind-key "C-z" nil)

(when window-system
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (menu-bar-mode -1)
  (tooltip-mode -1))

;; convert to short mode
(fset 'yes-or-no-p 'y-or-n-p)

(minibuffer-depth-indicate-mode)

;; use F5 to revert to original buffer
(global-set-key (kbd "<f5>") 'revert-buffer)

;; hide default startup message
(gsetq inhibit-startup-message t
       inhibit-startup-echo-area-message user-login-name
       inhibit-default-init t
       initial-scratch-message nil)

;; blinking cursor
(blink-cursor-mode -1)


(window-divider-mode)

;; HIGHLIGHT CURRENT LINE
(global-hl-line-mode t)

;; HISTORY AND BACKUP
(gsetq delete-by-moving-to-trash t
       delete-old-versions t
       history-delete-duplicates t
       savehist-save-minibuffer-history 1
       bookmark-default-file "~/Dropbox/IMPORTANT/Notes/bookmarks"
       bookmark-save-flag 1
       history-length 500
       kept-new-versions 10
       kept-old-versions 2
       version-control t)

;; Puts all the backups into one folder
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

(setq x-gtk-use-system-tooltips nil
      x-underline-at-descent-line t)

(size-indication-mode 1)

;; accelerate the cursor when scrolling.
(load "accel" t t)

;; make selections and clipboard behave properly
(delete-selection-mode t)
(transient-mark-mode t)

;; enable clipboard
(setq select-enable-clipboard t)

;; highlight regions and add special behaviors to regions
(setq transient-mark-mode t)

;; always new line at the eof
(setq require-final-newline t)

;; follow symbolic links
(setq vc-follow-symlinks t)

;; set default browser
(setq browse-url-browser-function 'browse-url-default-macosx-browser)

;; UI
(gsetq initial-frame-alist '((fullscreen))
       custom-safe-themes t
       frame-inhibit-implied-resXize t
       cursor-in-non-selected-windows nil
       highlight-non-selected-windows nil
       mode-line-default-help-echo nil
       use-dialog-box nil
       visible-cursor nil
       visible-bell nil
       auto-compression-mode t
       random t
       scroll-conservatively 1
       read-buffer-completion-ignore-case t
       sentence-end-double-space nil
       x-stretch-cursor nil ;; makes cursor width of the character is under
       pos-tip-internal-border-width 6
       pos-tip-border-width 1
       window-resize-pixelwise t
       frame-resize-pixelwise t
       echo-keystrokes 0.2
       window-divider-default-places t
       window-divider-default-bottom-width 1
       window-divider-default-right-width 1
       frame-title-format '("%b - Emacs"))

;; set memory configurations
(setq gc-cons-threshold 50000000)
(setq gnutls-min-prime-bits 4096)


;; EDITOR
(gsetq tab-width 2
       case-fold-search t
       indent-tabs-mode nil
       require-final-newline t
       more-require-final-newline t
       sentence-end-double-space nil
       tab-always-intent 'complete
       tabify-regexp "^\t* [ \t]+"
       word-wrap t
       fill-column 90
       truncate-lines t
       truncate-partial-width-windows 70)

;; SCROLLING
(gsetq scroll-margin 1
       hscroll-margin 2
       hscroll-step 1
       scroll-conservatively 101
       scroll-preserve-screen-position t
       mouse-wheel-scroll-amount '(1)
       mouse-wheel-progressive-speed nil)

;; LIMITS
;;(gsetq kill-ring-max 5000
;;       undo-limit (* 20 1024 1024)
;;       undo-strong-limit (* 40 1024 1024)
;;       undo-outer-limit (* 100 1024 1024)
;;       mark-ring-max 500
;;       globa-mark-ring-max 5000)

;; copy selected text with mouse
(setq mouse-drag-copy-region t)

;; prevents C-z minimize to terminal (fg to restore)
(bind-key "C-z" nil)


;;;;;;;;;;;;;;
;; Windsize ;;
;;;;;;;;;;;;;;
(use-package windsize
  :ensure t
  :init
  (windsize-default-keybindings))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Projectile
;;; Manage projects

(use-package projectile
  :ensure t
  :defer t
  :bind (
	 ("M-P" . projectile-switch-open-project)
	 ("M-p" . projectile-switch-project))
  :config
  (helm-projectile-on)
  (progn
    (setq projectile-completion-system 'helm
	  projectile-require-project-root nil
	  projectile-switch-project-action 'helm-projectile-find-file
	  projectile-enable-caching nil)

    (setq projectile-project-search-path '("~/.emacs.d" "~/Projects/narven" "~/Projects/connido" "~/Projects/eunice" "~/Projects/other" "~/Projects/narventek"))
    (setq projectile-globally-ignored-directories (append '(
							    ".git"
							    ".svn"
							    "node_modules"
							    )))
    (setq projectile-globally-ignored-files (append '(
						      ".DS_Store"
						      "*.gz"
						      "*.pyc"
						      "*.jar")))
    )
  :init
  (projectile-global-mode)
  )





;;;;;;;;;;;;;;;;;;;;;;;;;;; ORG Mode

(use-package org
  :ensure org-plus-contrib
  :delight org-mode "Ø"
  :bind (
	 ("C-c l" . org-store-link)
	 ("C-c a" . org-agenda)
	 ("C-c c" . org-capture)
	 ("C-c b" . org-iswitchb)
	 )
  :config
  (progn
    (setq org-directory "~/Dropbox/Notes/agenda"
	  org-default-notes-file "~/Dropbox/Notes/notebook/organizer.org"
	  org-log-done t
	  org-agenda-files (
			    list "~/Dropbox/Notes/agenda/work.org"
				 "~/Dropbox/Notes/agenda/narventek.org"
				 "~/Dropbox/Notes/agenda/home.org")
	  org-agenda-dim-blocked-tasks nil
	  org-agenda-compact-blocks t
	  org-agenda-show-all-dates t
	  org-agenda-ndays 7
	  org-agenda-start-on-weekday nil
	  org-agenda-start-with-log-mode t
	  org-export-publishing-directory "~/Dropbox/Notes/export"
	  org-agenda-skip-deadline-if-done t
	  org-agenda-skip-scheduled-if-done t
	  org-reverse-note-order t
	  org-clock-modeline-total 'current
	  org-clock-persist 'history
	  alert-default-style 'libnotify)))

;; C-x r j and then register
(set-register ?0 (cons 'file "~/Dropbox/Notes/notebook/organizer.org"))

(use-package org-contacts
  :ensure nil
  :after org
  :custom (org-contacts-files '("~/Dropbox/Notes/contacts/contacts.org")))

(use-package org-vcard
  :ensure nil
  :after org)

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda() (org-bullets-mode 1))))

(use-package org-mu4e
  :ensure nil
  :custom
  (org-mu4e-convert-to-html t))

;;;;;;;;;;;;;;;;;; ORG Mode Language

(use-package ob-restclient
  :ensure t
  :after org)

(use-package ob-typescript
  :ensure t
  :after org)

(use-package ob-elixir
  :ensure t
  :after org)

(use-package ob-mongo
  :ensure t
  :after org)

(use-package ob-rust
  :ensure t
  :after org)

(use-package ob-sql-mode
  :ensure t
  :after org)

(use-package ob-tmux
  :ensure t
  :after org)

(use-package ob-http
  :ensure t
  :after org)

(use-package ob-go
  :ensure t
  :after org)

(use-package ob-browser
  :ensure t
  :after org)


(org-babel-do-load-languages
 'org-babel-load-languages
 '((ditaa . t)
   (typescript . t)))

(use-package deft
  :ensure t
  :bind ("<f8>" . deft)
  :commands (deft)
  :config
  (progn
    (setq deft-directory "~/Dropbox/Notes/notebook"
	  deft-extensions '("md" "org" "txt")
	  deft-recursive t
	  deft-default-extension "org"
	  deft-use-filename-as-title nil
	  deft-use-filter-string-for-filename t
	  deft-file-naming-rules '((nospace . "-"))
	  )))


;;;;;;;;;;;;;;;;;;;;;;;;;;;; Dired
;;; File explorer

(use-package dired
  :ensure nil
  :delight dired-mode "Dired"
  :init
  (add-hook 'dired-load-hook
	    (function (lambda() (load "dired-x"))))
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Magit
;;;  GIT manager

(use-package magit
  :ensure t
  :bind (("M-4" . magit-status))
  :when (executable-find "git")
  :config
  (progn
    (setq magit-push-always-verify nil)
    (setq git-commit-summary-max-length 70)
    (setq magit-push-current-set-remote-if-missing nil)
    (define-key magit-mode-map (kbd "<tab>") 'magit-section-toggle))
  :custom
  (magit-completing-read-function #'ivy-completing-read)
  (magit-diff-refine-hunk 'all))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Git Gutter
;;; https://github.com/syohex/emacs-git-gutter

(use-package git-gutter
  :ensure t
  :diminish
  :custom
  (git-gutter:window-width 4)
  ;;(git-gutter:visual-line t)
  (git-gutter:handled-backends '(git hg bzr svn))
  :init (global-git-gutter-mode +1))

(use-package git-timemachine
  :ensure t)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Shortcut Keys
;;; This allows the adding of the # when using M-3 on UK keyboards

'(global-set-key (kbd "C-SPC") 'set-mark-command)

(define-key key-translation-map (kbd "A-3") (kbd "#"))

(global-set-key (kbd "A-x v") 'my-kill-word-at-point)

(global-set-key (kbd "C-z") 'undo)

(global-set-key (kbd "C-Z") 'redo)

;;;;;;;;;;;;;;;;;;;;; Multi Terminal
(global-set-key (kbd "M-5") 'multi-term)







(add-hook 'term-mode-hook (lambda () (linum-mode -1)))

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
  :init (load-theme 'doom-one t))

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(set-face-attribute 'default nil
		    :family "mononoki"
		    :height 135
		    :weight 'normal
		    :width 'normal)

;; Define some margins to the main window
(set-window-margins (selected-window) 2 2)
(setq-default left-fringe-width 5)
(setq-default right-fringe-width 0)

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

;;;;;;;;;;;;;;;;;;;;; Use all icons
;; It seams to helper nerdtree with icons
(use-package all-the-icons
  :ensure t)








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





;;;;;;;;;;;;;;;;;;;;;;;;;;;; YAML

(use-package yaml-mode
  :ensure t
  :delight yaml-mode "ψ"
  :mode "\\.yml\\'"
  :interpreter ("yml" . yml-mode))

(add-to-list 'auto-mode-alist '("\\Supfile*\\'" . yaml-mode))

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
  :ensure t
  :commands plantuml-mode
  :init
  (add-to-list 'auto-mode-alist '("\\.pu$" . plantuml-mode)))

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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Elm
(use-package elm-mode
  :ensure t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Go
(use-package go-mode
  :ensure t
  :init(
	autoload 'go-mode "go-mode" nil t
		 )
  :config
  (progn
    (add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode)))
  )





;;;;;;;;;;;;;;;;;;;;;; PDF
;;(use-package pdf-tools
;;  :ensure t
;;  :pin manual ;; manual update
;;  :config
;;  ;; init
;;  (pdf-tools-install)
;;  ;; open pdfs scaled to fit page
;;  (setq-default pdf-view-display-size 'fit-page)
;;  ;; automatic annotate hightlights
;;  (setq pdf-annot-activate-created-annotations t)
;;  ;; use normal isearch
;;  (define-key pdf-view-mode-map (kbd "C-s") 'isearch-forward)
;;  (add-hook 'pdf-view-mode-hook (lambda () (cua-mode 0)))
;;  ;; more fine grain zoom
;;  (setq pdf-view-resize-factor 1.1)
;;
;;  (use-package pdf-view
;;    :ensure nil
;;    :after pdf-tools
;;    :bind (:map pdf-view-mode-map
;;		("C-s" . isearch-forward))
;;    :custom (pdf-view-use-unicode-ligther nil)))






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
	    (setq helm-candidate-number-list 150)
	    (setq helm-mode-fuzzy-match t)
	    (setq helm-buffers-fuzzy-matching t)
	    (setq helm-autoresize-max-height 0)
	    (setq helm-autoresize-min-height 20)
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





;;;;;;;;;;;;;;;;;;;;;; Mail
(use-package mu4e
  :ensure nil
  ;;:ensure-system-package mu
  :custom
  (mu4e-attachment-dir "~/Downloads")
  (mu4e-confirm-quit nil)
  (mu4e-compose-signature-auto-include nil)
  (mu4e-completing-read-function 'ivy-completing-read)
  (mu4e-drafts-folder "/gmail/Drafts")
  (mu4e-get-mail-command "mbsync -a")
  (mu4e-maildir "~/Maildir")
  (mu4e-maildir-shortcuts
   '(("/gmail/INBOX" . ?i)
     ("/gmail/All Mail" . ?a)
     ("/gmail/Deleted Items" . ?d)
     ("/gmail/Drafts" . ?D)
     ("/gmail/Important" . ?i)
     ("/gmail/Sent Mail" . ?s)
     ("/gmail/Starred" . ?S)))
  (mu4e-html2text-command "iconv -c -t utf-8 | pandoc -f html -t plain")
  (mu4e-org-contacts-file "~/Dropbox/IMPORTANT/Notes/contacts.org")
  (mu4e-refile-folder "/gmail/Archive")
  (mu4e-sent-folder "/gmail/Sent Mail")
  (mu4e-sent-messages-behavior 'delete)
  (mu4e-trash-folder "/gmail/Trash")
  (mu4e-update-interval 60)
  (mu4e-use-fancy-chars t)
  (mail-user-agent 'mu4e-user-agent)
  (mu4e-view-show-addresses t)
  (mu4e-view-show-images t)
  :config
  (add-to-list 'mu4e-headers-actions '("org-contact-add" . mu4e-action-add-org-contact) t)
  (add-to-list 'mu4e-view-actions '("org-contact-add" . mu4e-action-add-org-contact) t))

(use-package mu4e-alert
  :after mu4e
  :hook ((after-init . mu4e-alert-enable-mode-line-display)
	 (after-init . mu4e-alert-enable-notifications))
  :config (mu4e-alert-set-default-style 'libnotify))







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






;;;;;;;;;;;;;;;;;; Typescript
;;; Handles all the setup for Typescript
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency, you have to
  ;; install it separately via ...
  (company-mode +1))

(use-package tide
  :ensure t
  :after (typescript-mode company flycheck)
  :hook (before-save . tide-format-before-save))







;;;;;;;;;;;;;;;;;;;;;; Lorem Ipsum
(use-package lorem-ipsum
  :ensure t
  :bind (("C-c C-v l" . lorem-ipsum-insert-list)
	 ("C-c C-v p" . lorem-ipsum-insert-paragraphs)
	 ("C-c C-v s" . lorem-ipsum-insert-sentences)))


;;;;;;;;;;;;;;;;;;; EYEBROWSE
;;;  Manage Workspaces (this is not working the meta shortcuts dont seem to work)
(use-package eyebrowse
  ;;:ensure t
  :diminish eyebrowse-mode
  :config (progn
	    (define-key eyebrowse-mode-map (kbd "M-S-1") 'eyebrowse-switch-to-window-config-1)
	    (define-key eyebrowse-mode-map (kbd "M-S-2") 'eyebrowse-switch-to-window-config-2)
	    (define-key eyebrowse-mode-map (kbd "M-S-3") 'eyebrowse-switch-to-window-config-3)
	    (define-key eyebrowse-mode-map (kbd "M-0") 'eyebrowse-switch-to-window-config-4)
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
;;(use-package which-key
;;  :ensure t
;;  :init
;;  (setq which-key-separator " ")
;;  (setq which-key-prefix-prefix "+")
;;  :config (which-key-mode 1))


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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(dired-auto-revert-buffer t)
 '(dired-dwim-target t)
 '(dired-hide-details-hide-symlink-targets nil)
 '(dired-listing-switches "-alh")
 '(dired-ls-F-marks-symlinks nil)
 '(dired-recursive-copies (quote always))
 '(dired-recursive-deletes (quote always))
 '(git-gutter:handled-backends (quote (git hg bzr svn)))
 '(git-gutter:window-width 4)
 '(magit-completing-read-function (quote ivy-completing-read) t)
 '(magit-diff-refine-hunk (quote all) t)
 '(org-contacts-files (quote ("~/Dropbox/Notes/contacts/contacts.org")) t)
 '(org-mu4e-convert-to-html t t)
 '(package-selected-packages
   (quote
    (dired-x windsize yasnippet-snippets yarn-mode yaml-mode xref-js2 wttrin which-key webpaste web-mode vue-mode use-package undo-tree try tldr tide terraform-mode switch-window swiper sql-indent smooth-scrolling smartparens smart-mode-line shell-pop sass-mode rainbow-mode rainbow-delimiters python-mode prettier-js powerline po-mode plantuml-mode paradox origami org-plus-contrib org-bullets ob-typescript ob-tmux ob-sql-mode ob-rust ob-restclient ob-mongo ob-http ob-go ob-elixir ob-browser nord-theme nimbus-theme neotree multi-term move-text markdown-mode magit lorem-ipsum json-mode js2-refactor imgbb hungry-delete highlight-current-line helm-projectile helm-gitignore go-mode git-timemachine git-gutter general eyebrowse expand-region eww-lnum emmet-mode elm-mode elixir-mix editorconfig doom-themes dockerfile-mode dired-ranger deft csv-mode beacon auto-complete all-the-icons alert alchemist aggressive-indent ace-window))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 2.0)))))
