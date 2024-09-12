;; Required Packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(require 'org)
(require 'auctex)
(require 'exwm)
(require 'exwm-config)
(require 'package)
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(exwm-enable)

(menu-bar-mode -1)
(load-theme 'alect-dark t)
(setq package-selected-packages
'(xwidgete org-agenda-property tramp org-roam multishell nix-mode ## package-lint alect-themes org org-auto-tangle org-contacts org-contrib org-drill org-edna org-jami-bot org-journal org-mime org-modern org-notify org-present org-real org-remark org-superstar org-transclusion org-transclusion-http org-translate org-tree-slide orgalist orgit luwak exwm f90-interface-browser auctex auctex-cont-latexmk auctex-label-numbers cdlatex company-math latex-table-wizard math-symbol-lists preview-tailor tex-item tex-parens company-mode))
(tab-bar-mode -1)
(tool-bar-mode -1)
(global-company-mode)
;; Turn off startup screen
(setq inhibit-startup-screen t)

;;;; WINDOW MANAGEMENT

;;Allow Window Restoration
(setq winner-dont-bind-my-keys t) ;stop winner from binding all the good shortcuts
(winner-mode 1)

;;Allow for window movement with keys
;(setq shift-select-mode t)
(global-set-key (kbd "\C-c <left>") 'windmove-left)
(global-set-key (kbd "\C-c <right>") 'windmove-right)
(global-set-key (kbd "\C-c <up>") 'windmove-up)
(global-set-key (kbd "\C-c <down>") 'windmove-down)


;; Stop ctrl+z from suspending emacs before you die.
(global-unset-key (kbd "\C-z"))
(global-set-key (kbd "\C-z") 'winner-undo)

;;;; CUSTOM PROGRAMS

;(setq-default explicit-shell-file-name "/bin/fish")
(setq comint-prompt-read-only t)

;;;; ORG MODE VARIABLES
(transient-mark-mode 1)
(setq org-enable-priority-commands t
      org-highest-priority ?A
      org-default-priority ?D
      org-lowest-priority ?G)
(setq org-roam-directory (file-truename "~/Desktop/OrgFiles"))
(setq find-file-visit-truename t)
(org-roam-db-autosync-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(company company-auctex company-bibtex company-c-headers company-dict company-emacs-eclim company-go company-nixos-options company-org-block company-shell c-eldoc c-eval c0-mode elpy ac-capf anaconda-mode bash-completion jedi xwidgete org-agenda-property tramp org-roam multishell nix-mode ## package-lint alect-themes org org-auto-tangle org-contacts org-contrib org-drill org-edna org-jami-bot org-journal org-mime org-modern org-notify org-present org-real org-remark org-superstar org-transclusion org-transclusion-http org-translate org-tree-slide orgalist orgit luwak exwm f90-interface-browser auctex auctex-cont-latexmk auctex-label-numbers cdlatex company-math latex-table-wizard math-symbol-lists preview-tailor tex-item tex-parens)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
