;;; post-init.el --- post-init file -*- no-byte-compile: t; lexical-binding: t; -*-

;; Setup autosave and backup file directory
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Wrap Lines by default
(global-visual-line-mode 1)

;; Add Tabline
(global-tab-line-mode 1)

;; theme
(load-theme 'modus-vivendi)             ; Dark theme

;; Setup fonts
(set-face-attribute 'default nil :family "Iosevka Term")
(set-face-attribute 'variable-pitch nil :family "Iosevka Aile")
;(set-face-attribute 'org-modern-symbol nil :family "Iosevka")

;; Add frame borders and window dividers
;(modify-all-frames-parameters
; '((right-divider-width . 40)
;   (internal-border-width . 40)))
(dolist (face '(window-divider
                window-divider-first-pixel
                window-divider-last-pixel))
  (face-spec-reset-face face)
  (set-face-foreground face (face-attribute 'default :background)))
(set-face-background 'fringe (face-attribute 'default :background))

(setq ns-right-alternate-modifier nil)

(add-hook 'prog-mode-hook 'display-line-numbers-mode) ; enable line numbers globally

;; Add global keybindings
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Setup IDO
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; Garbage Collection
(use-package gcmh
  :ensure t
  :hook (after-init . gcmh-mode)
  :custom
  (gcmh-idle-delay 'auto)
  (gcmh-auto-idle-delay-factor 10)
  (gcmh-low-cons-threshold minimal-emacs-gc-cons-threshold))

;; Setup PHP Mode
(use-package php-mode
  :ensure t
  )

;; Setup Web Mode
(use-package web-mode
  :ensure t
  :mode
  (("\\.phtml\\'" . web-mode)
   ("\\.php\\'" . web-mode)
   ("\\.tpl\\'" . web-mode)
   ("\\.[agj]sp\\'" . web-mode)
   ("\\.as[cp]x\\'" . web-mode)
   ("\\.erb\\'" . web-mode)
   ("\\.mustache\\'" . web-mode)
   ("\\.djhtml\\'" . web-mode)
   ("\\.mjml\\'" . web-mode))
  :config
  (setq web-mode-engines-alist
        '(("smarty" . "\\.mjml\\'")))
  )

;; Setup projectile
(use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
  :bind (:map projectile-mode-map
              ("s-p" . projectile-command-map)
              ("C-c p" . projectile-command-map)))

;; Setup treemacs
(use-package treemacs
  :ensure t
  :config
  (progn
    (treemacs-project-follow-mode t)
   )
  :bind
  (("M-0" . treemacs-select-window)
   ("M-=" . treemacs)))

(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t)

;; Setup ace-window
(use-package ace-window
  :ensure t
  :bind
  (("M-o" . ace-window)))

;; Setup org-mode
(use-package org
  :mode (("\\.org$" . org-mode))
  :ensure t
  :config
  (progn
    (setq org-todo-keywords
          '((sequence "TODO" "NEXT" "IN-PROGRESS" "WAITING" "DONE"))) ; set todo states

    (setq org-log-done 'time)
    (setq org-agenda-skip-function-global '(org-agenda-skip-entry-if 'todo 'done))
    (setq org-deadline-warning-days 2)
    (setq org-agenda-files '("~/org"))
    (setq org-startup-indented t)

    (setq org-refile-use-outline-path t)
    (setq org-refile-targets
          '((org-agenda-files . (:maxlevel . 4))))
    
    (setq
     ;; Edit settings
     org-auto-align-tags nil
     org-tags-column 0
     org-catch-invisible-edits 'show-and-error
     org-special-ctrl-a/e t
     org-insert-heading-respect-content t

     ;; Org styling, hide markup etc.
     org-hide-emphasis-markers t
     org-pretty-entities t

     ;; Agenda styling
     org-agenda-tags-column 0
     org-agenda-block-separator ?─
     org-agenda-time-grid
     '((daily today require-timed)
       (800 1000 1200 1400 1600 1800 2000)
       " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
     org-agenda-current-time-string
     "◀── now ─────────────────────────────────────────────────")

    ;; Ellipsis styling
    (setq org-ellipsis "…")
    )
  :bind
  (("C-c i" . org-indent-mode)))

;; Setup org-modern
(use-package org-modern
  :ensure t
  :after org)
(add-hook 'org-mode-hook #'org-modern-mode)
(add-hook 'org-agenda-finalize-hook #'org-modern-agenda)

