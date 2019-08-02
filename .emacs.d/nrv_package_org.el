;;;;;;;;;;;;;;;;;;;;;;;;;;; Org

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
    (setq org-directory "~/Dropbox/IMPORTANT/Notes/org/"
	  org-log-done t
	  org-agenda-files (
			    list "~/Dropbox/IMPORTANT/Notes/agenda/work.org"
				 "~/Dropbox/IMPORTANT/Notes/agenda/narventek.org"
				 "~/Dropbox/IMPORTANT/Notes/agenda/home.org")
	  org-agenda-dim-blocked-tasks nil
	  org-agenda-compact-blocks t
	  org-agenda-show-all-dates t
	  org-agenda-ndays 7
	  org-agenda-start-on-weekday nil
	  org-agenda-start-with-log-mode t
	  org-export-publishing-directory "~/Dropbox/IMPORTANT/Notes/export"
	  org-agenda-skip-deadline-if-done t
	  org-agenda-skip-scheduled-if-done t
	  org-reverse-note-order t
	  org-clock-modeline-total 'current
	  org-clock-persist 'history
	  (setq alert-default-style 'libnotify))))

(use-package org-contacts
  :ensure nil
  :after org
  :custom (org-contacts-files '("~/Dropbox/IMPORTANT/Notes/org/contacts.org")))

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

;;;;;;;;;;;;;;;;;; Languages
(use-package ob-restclient :ensure t :after org)
;;     (use-package ob-ditaa :ensure t :after org)
;;     (use-package ob-dot :ensure nil :after org)
;;     (use-package ob-emacs-lisp :ensure nil :after org)
;;     (use-package ob-gnuplot :ensure nil :after
;;     (use-package ob-js :ensure t :after org)
;;     (use-package ob-latex :ensure nil :after org)
;;     (use-package ob-ledger :ensure nil :after org)
;;     (use-package ob-makefile :ensure t :after org)
;;     (use-package ob-org :ensure t :after org)
;;     (use-package ob-typescript :ensure t :after org)
;;     (use-package ob-shell :ensure t :after org)
;;     (use-package ob-sh :ensure t :after org)
;; http://plantuml.com/download
;;     (use-package ob-plantuml
;;       :ensure nil
;;       :after org
;;       :custom (org-plantuml-jar-path (expand-file-name "~/.emacs.d/lib/plantuml.jar")))
;;     (use-package ob-python :ensure t :after org)
;;     (use-package ob-ruby :ensure t :after org)
;;     (use-package ob-sql :ensure t :after org)
