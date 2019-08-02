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
