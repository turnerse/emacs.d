;;; package -- Summary
;;; Commentary:
;;; Code:

(message "loading site-lisp/init-local.el")

;; show changes to file in the sidebar
(if (display-graphic-p)
    (use-package git-gutter-fringe
      :ensure t
      :init (global-git-gutter-mode))
  (use-package git-gutter
    :ensure t
    :init (global-git-gutter-mode)))

;; ;; Disable org’s ELPA packages fd
;; (setq package-load-list '(all
;;                           (org nil)))
;; (add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)


(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package org-roam
             :ensure t
             :hook
             (after-init . org-roam-mode)
             :custom
             (org-roam-directory "~/org-roam")
             (org-roam-index-file "index.org")

             :bind (:map org-roam-mode-map
                         (("C-c m l" . org-roam)
                          ("C-c m F" . org-roam-find-file)
                          ("C-c m r" . org-roam-find-ref)
                          ("C-c m ." . org-roam-find-directory)
                          ("C-c m d" . org-roam-dailies-map)
                          ("C-c m j" . org-roam-jump-to-index)
                          ("C-c m b" . org-roam-switch-to-buffer)
                          ("C-c m g" . org-roam-graph))
                         :map org-mode-map
                         (("C-c m i" . org-roam-insert))
                         (("C-c m I" . org-roam-insert-immediate))))

;; Do not display continuation lines
(set-default 'truncate-lines t)

;; Enable line-restricted horizontal scrolling
(setq auto-hscroll-mode 'current-line)

;; Time
(setq display-time-default-load-average nil)
(display-time-mode 1)


(provide 'init-local)

;;; init-local.el ends here
