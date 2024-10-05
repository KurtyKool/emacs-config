;; Required Packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(require 'org)
(require 'auctex)
(require 'exwm)
(require 'package)
(exwm-enable)

;(exwm-systemtray-enable) ;;can't get this working, for some reason

(menu-bar-mode -1)
(load-theme 'alect-dark t)
(setq package-selected-packages
'(xwidgete org-agenda-property tramp org-roam multishell nix-mode ## package-lint alect-themes org org-auto-tangle org-contacts org-contrib org-drill org-edna org-jami-bot org-journal org-mime org-modern org-notify org-present org-real org-remark org-superstar org-transclusion org-transclusion-http org-translate org-tree-slide orgalist orgit luwak exwm f90-interface-browser auctex auctex-cont-latexmk auctex-label-numbers cdlatex company-math latex-table-wizard math-symbol-lists preview-tailor tex-item tex-parens company-mode company company-auctex company-bibtex company-c-headers company-dict company-emacs-eclim company-go company-nixos-options company-org-block company-shell c-eldoc c-eval c0-mode elpy ac-capf anaconda-mode bash-completion jedi xwidgete org-agenda-property tramp org-roam multishell nix-mode ## package-lint alect-themes org org-auto-tangle org-contacts org-contrib org-drill org-edna org-jami-bot org-journal org-mime org-modern org-notify org-present org-real org-remark org-superstar org-transclusion org-transclusion-http org-translate org-tree-slide orgalist orgit luwak exwm f90-interface-browser auctex auctex-cont-latexmk auctex-label-numbers cdlatex company-math latex-table-wizard math-symbol-lists preview-tailor tex-item tex-parens))
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

;;Stupid Major Modes keep over-riding my keybinds, so let's make a minor mode that can't be overwritten
(defvar my/keys-keymap (make-keymap)
  "Keymap for my/keys-mode")
(define-minor-mode my/keys-mode
  "Minor mode for my personal keybindings so major modes can't keep fucking my shit up."
  :init-value t
  :global t
  :keymap my/keys-keymap)
(add-to-list `emulation-mode-map-alists
	     `((my/keys-mode . ,my/keys-keymap)))
(define-key my/keys-keymap (kbd "\C-c <left>") 'windmove-left)
(define-key my/keys-keymap (kbd "\C-c <right>") 'windmove-right)
(define-key my/keys-keymap (kbd "\C-c <up>") 'windmove-up)
(define-key my/keys-keymap (kbd "\C-c <down>") 'windmove-down)
(define-key my/keys-keymap (kbd "\C-z") `winner-undo) ;Stop ctrl-z from fucking up emacs
(define-key my/keys-keymap (kbd "\C-x \C-b") `buffer-menu)

;; Stop windows opening in new tabs.

(setq pop-up-windows nil)

;; Stop ctrl+z from suspending emacs before you die.
(global-unset-key (kbd "\C-z"))
(global-set-key (kbd "\C-z") 'winner-undo)

;;;; CUSTOM PROGRAMS

;(setq-default explicit-shell-file-name "/bin/fish")
(setq comint-prompt-read-only t)
(setq markdown-hide-markup t)

;;;; ORG MODE VARIABLES
(transient-mark-mode 1)
(setq org-enable-priority-commands t
      org-highest-priority ?A
      org-default-priority ?D
      org-lowest-priority ?G)
;(setq org-roam-directory (file-truename "~/Desktop/OrgFiles"))
(setq find-file-visit-truename t)
;(org-roam-db-autosync-mode)

;;CUSTOM HOOK ADDITIONS
(defun startmarkdown ()
  (variable-pitch-mode 1)
  (setq markdown-header-scaling t)
  (setq markdown-enable-math t)
  (setq left-margin-width 12)
  (setq right-margin-width 9)
  )
(add-hook `markdown-mode-hook `startmarkdown)

(add-hook `exwm-update-class-hook
	  (lambda ()
	    (exwm-workspace-rename-buffer exwm-class-name)))

(defun nomargins ()
  (interactive)
  (setq left-margin-width 0)
  (setq right-margin-width 0)
  )

(defun smallmargins ()
  (interactive)
  (setq left-margin-width 5)
  (setq right-margin-width 4)
  )

(defun setmargins (lw rw)
  (setq left-margin-width lw)
  (setq right-margin-width rw)
  )

(defun opensudo ()
  (interactive)
  (let ((p (point)))
    (when (buffer-file-name)
      (find-alternate-file
       (concat "/sudo::" (buffer-file-name)))
      (goto-char p))))

;;; ALLOW RESIZING WINDOWS WITH THE MOUSE
(setq window-divider-default-bottom-width 2
      window-divider-default-right-width 2)
(set-face-foreground `window-divider "black")
(window-divider-mode)

;; STOP ASYNCH SHELLS FROM APPEARING
(add-to-list 'display-buffer-alist
	     (cons "\\*Async Shell Command\\*.*" (cons #'display-buffer-no-window nil)))
(add-to-list 'display-buffer-alist
	     (cons "\\*\\(Backtrace\\|Compile-log\\|Messages\\|Warnings\\)\\*" (cons #'display-buffer-no-window nil)))




(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(markdown-mode markdown-preview-mode xwidgete org-agenda-property tramp org-roam multishell nix-mode ## package-lint alect-themes org org-auto-tangle org-contacts org-contrib org-drill org-edna org-jami-bot org-journal org-mime org-modern org-notify org-present org-real org-remark org-superstar org-transclusion org-transclusion-http org-translate org-tree-slide orgalist orgit luwak exwm f90-interface-browser auctex auctex-cont-latexmk auctex-label-numbers cdlatex company-math latex-table-wizard math-symbol-lists preview-tailor tex-item tex-parens company-mode company company-auctex company-bibtex company-c-headers company-dict company-emacs-eclim company-go company-nixos-options company-org-block company-shell c-eldoc c-eval c0-mode elpy ac-capf anaconda-mode bash-completion jedi xwidgete org-agenda-property tramp org-roam multishell nix-mode ## package-lint alect-themes org org-auto-tangle org-contacts org-contrib org-drill org-edna org-jami-bot org-journal org-mime org-modern org-notify org-present org-real org-remark org-superstar org-transclusion org-transclusion-http org-translate org-tree-slide orgalist orgit luwak exwm f90-interface-browser auctex auctex-cont-latexmk auctex-label-numbers cdlatex company-math latex-table-wizard math-symbol-lists preview-tailor tex-item tex-parens)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(eval-after-load "dired-aux"
   '(add-to-list 'dired-compress-file-suffixes 
                 '("\\.zip\\'" ".zip" "unzip")))
