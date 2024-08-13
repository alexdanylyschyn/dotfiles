(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; Disable the splash screen (to enable it agin, replace the t with 0)
(setq inhibit-splash-screen t)

;; Wrap Lines by default
(global-visual-line-mode 1)

;; Disable scrollbars
(scroll-bar-mode -1)

;; theme
(load-theme 'modus-vivendi)             ; Dark theme

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

(global-org-modern-mode)

(setq ns-right-alternate-modifier nil)

(add-hook 'prog-mode-hook 'display-line-numbers-mode) ; enable line numbers globally

;; Add global keybindings
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "M-o") #'ace-window)
(global-set-key (kbd "M-0") #'treemacs-select-window)

;; org mode config
(setq org-todo-keywords
  '((sequence "TODO" "NEXT" "IN-PROGRESS" "WAITING" "DONE"))) ; set todo states

(setq org-log-done 'time)

;;org mode keybindings
(add-hook
     'org-mode-hook
      (lambda ()
	(local-set-key (kbd "C-c i") #'org-indent-mode)
      ))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files '("~/org"))
 '(org-sidebar-default-fns '(org-sidebar--upcoming-items org-sidebar--todo-items))
 '(package-selected-packages '(org-modern treemacs ace-window)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "IosevkaTerm Nerd Font" :foundry "nil" :slant normal :weight regular :height 120 :width normal)))))
