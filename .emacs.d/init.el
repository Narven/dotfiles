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

(setq package-archives '(("melpa-stable" . "http://stable.melpa.org/packages/")
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

(load (nrv-get-fullpath "nrv_helpers"))
(load (nrv-get-fullpath "nrv_general_settings"))
(load (nrv-get-fullpath "nrv_package_projectile"))
(load (nrv-get-fullpath "nrv_package_org"))
(load (nrv-get-fullpath "nrv_package_dired"))
(load (nrv-get-fullpath "nrv_package_magit"))
(load (nrv-get-fullpath "nrv_shortcuts"))
(load (nrv-get-fullpath "nrv_package_ui"))
(load (nrv-get-fullpath "nrv_package_web"))
(load (nrv-get-fullpath "nrv_package_languages"))
(load (nrv-get-fullpath "nrv_package_pdf"))
(load (nrv-get-fullpath "nrv_package_helm"))
(load (nrv-get-fullpath "nrv_package_mail"))
(load (nrv-get-fullpath "nrv_package_speed"))
(load (nrv-get-fullpath "nrv_package_company"))
(load (nrv-get-fullpath "nrv_package_typescript"))
(load (nrv-get-fullpath "nrv_package_other"))
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
 '(org-mu4e-convert-to-html t t)
 '(package-selected-packages
   (quote
    (elixir-mode terraform-mode yasnippet-snippets yarn-mode yaml-mode xref-js2 wttrin which-key webpaste web-mode vue-mode use-package undo-tree try tldr tide switch-window swiper sql-indent smooth-scrolling smartparens smart-mode-line shell-pop sass-mode rainbow-mode rainbow-delimiters python-mode prettier-js powerline po-mode plantuml-mode paradox origami org-plus-contrib org-bullets ob-restclient nimbus-theme multi-term move-text markdown-mode magit lorem-ipsum json-mode js2-refactor imgbb hungry-delete highlight-current-line helm-projectile helm-gitignore git-timemachine git-gutter general eyebrowse expand-region eww-lnum emmet-mode elixir-mix editorconfig dockerfile-mode deft csv-mode company beacon auto-complete alert aggressive-indent ace-window))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 2.0)))))
