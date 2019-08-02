;;; Fonts
(set-face-attribute 'default nil
                    :family "Hack"
                    :height 120
                    :weight 'normal
                    :width 'normal)

;;; Encodings

;; keep cursor at the same position when scrolling
(setq scroll-preserve-screen-position 1)

;;(use-package diminish)
;;(use-package bind-key)

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

;; UI
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
