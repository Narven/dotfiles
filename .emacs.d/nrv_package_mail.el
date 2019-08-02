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
