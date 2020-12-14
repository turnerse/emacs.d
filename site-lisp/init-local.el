;;; package -- Summary
;;; Commentary:
;;; Code:

(message "loading site-lisp/init-local.el")


(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; show changes to file in the sidebar
(if (display-graphic-p)
    (use-package git-gutter-fringe
      :ensure t
      :init (global-git-gutter-mode))
  (use-package git-gutter
    :ensure t
    :init (global-git-gutter-mode)))

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

;; deft
(use-package deft
  :commands deft
  :init
  (setq deft-default-extension "org"
        deft-extensions '("org")
        deft-directory "~/org"
        deft-recursive t
        deft-text-mode 'org-mode
        ;; de-couples filename and note title:
        deft-use-filename-as-title nil
        deft-use-filter-string-for-filename t
        ;; disable auto-save
        deft-auto-save-interval -1.0
        ;; converts the filter string into a readable file-name using kebab-case:
        deft-file-naming-rules
        '((noslash . "-")
          (nospace . "-")
          (case-fn . downcase)))
  :config
  ;; placeholder
  (message "deft config from use-package")
  )

;; alphapapa's stuff
(use-package helm-org-rifle)

;; read https://www.reddit.com/r/orgmode/comments/dgm4da/zettelkästen_hacker_news/f3e0jbb
(use-package helm-org-ql)


(require 'org-gcal)
(setq org-gcal-client-id "158847240586-92fg4lrhq2vjugbho0h4dl0fga9p2jup.apps.googleusercontent.com"
      org-gcal-client-secret "nyCEtr4T9-vDN2y9s4aeWWrr"
      org-gcal-file-alist '(("turnerse@gmail.com" .  "~/org/gcal.org")
                            ))

;; keybindings
(global-set-key (kbd "C-x C-r") 'counsel-recentf)


;; Do not display continuation lines
(set-default 'truncate-lines t)

;; Enable line-restricted horizontal scrolling
(setq auto-hscroll-mode 'current-line)

;; Time
(setq display-time-default-load-average nil)
(display-time-mode 1)



(provide 'init-local)

;;; init-local.el ends here
