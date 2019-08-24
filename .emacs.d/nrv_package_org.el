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
