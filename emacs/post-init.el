;;; post-init.el --- post-init file -*- no-byte-compile: t; lexical-binding: t; -*-

;; Wrap Lines by default
(global-visual-line-mode 1)

;; theme
(load-theme 'modus-vivendi)             ; Dark theme

;; Org Modern Styling
(set-face-attribute 'default nil :family "Iosevka")
(set-face-attribute 'variable-pitch nil :family "Iosevka Aile")
;(set-face-attribute 'org-modern-symbol nil :family "Iosevka")

;; Add frame borders and window dividers
(modify-all-frames-parameters
 '((right-divider-width . 40)
   (internal-border-width . 40)))
(dolist (face '(window-divider
                window-divider-first-pixel
                window-divider-last-pixel))
  (face-spec-reset-face face)
  (set-face-foreground face (face-attribute 'default :background)))
(set-face-background 'fringe (face-attribute 'default :background))

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

(setq ns-right-alternate-modifier nil)

(add-hook 'prog-mode-hook 'display-line-numbers-mode) ; enable line numbers globally

;; Add global keybindings
(global-set-key (kbd "C-c a") #'org-agenda)

;; Setup treemacs

(use-package treemacs
  :ensure t
  :bind
  (("M-0" . treemacs-select-window)
   ("M-=" . treemacs)))

;; Setup ace-window
(use-package ace-window
  :ensure t
  :bind
  (("M-o" . ace-window)))

;; Setup org-modern
(use-package org-modern
  :ensure t
  :after org)
(add-hook 'org-mode-hook #'org-modern-mode)
(add-hook 'org-agenda-finalize-hook #'org-modern-agenda)

;; org mode config
(setq org-todo-keywords
  '((sequence "TODO" "NEXT" "IN-PROGRESS" "WAITING" "DONE"))) ; set todo states

(setq org-log-done 'time)
(setq org-agenda-skip-function-global '(org-agenda-skip-entry-if 'todo 'done))
(setq org-deadline-warning-days 2)
(setq org-agenda-files '("~/org"))
(setq org-startup-indented t)

;;org mode keybindings
(add-hook
     'org-mode-hook
      (lambda ()
	(local-set-key (kbd "C-c i") #'org-indent-mode)
      ))
