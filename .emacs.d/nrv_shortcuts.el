;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Shortcut Keys
;;; This allows the adding of the # when using M-3 on UK keyboards

'(global-set-key (kbd "C-SPC") 'set-mark-command)

(define-key key-translation-map (kbd "A-3") (kbd "#"))

(global-set-key (kbd "A-x v") 'my-kill-word-at-point)

(global-set-key (kbd "C-z") 'undo)

(global-set-key (kbd "C-Z") 'redo)

;;;;;;;;;;;;;;;;;;;;; Multi Terminal
(global-set-key (kbd "M-5") 'multi-term)
