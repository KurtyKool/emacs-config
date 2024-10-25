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


(load-theme 'alect-dark t)
(setq package-selected-packages
      '(xwidgete org-agenda-property tramp org-roam multishell nix-mode ## package-lint alect-themes org org-auto-tangle org-contacts org-contrib org-drill org-edna org-jami-bot org-journal org-mime org-modern org-notify org-present org-real org-remark org-superstar org-transclusion org-transclusion-http org-translate org-tree-slide orgalist orgit luwak exwm f90-interface-browser auctex auctex-cont-latexmk auctex-label-numbers cdlatex company-math latex-table-wizard math-symbol-lists preview-tailor tex-item tex-parens company-mode company company-auctex company-bibtex company-c-headers company-dict company-emacs-eclim company-go company-nixos-options company-org-block company-shell c-eldoc c-eval c0-mode elpy ac-capf anaconda-mode bash-completion jedi xwidgete org-agenda-property tramp org-roam multishell nix-mode ## package-lint alect-themes org org-auto-tangle org-contacts org-contrib org-drill org-edna org-jami-bot org-journal org-mime org-modern org-notify org-present org-real org-remark org-superstar org-transclusion org-transclusion-http org-translate org-tree-slide orgalist orgit luwak exwm f90-interface-browser auctex auctex-cont-latexmk auctex-label-numbers cdlatex company-math latex-table-wizard math-symbol-lists preview-tailor tex-item tex-parens markdown-mode markdown-preview-mode xwidgete org-agenda-property tramp org-roam multishell nix-mode package-lint alect-themes org org-auto-tangle org-contacts org-contrib org-drill org-edna org-jami-bot org-journal org-mime org-modern org-notify org-present org-real org-remark org-superstar org-transclusion org-transclusion-http org-translate org-tree-slide orgalist orgit luwak exwm f90-interface-browser auctex auctex-cont-latexmk auctex-label-numbers cdlatex company-math latex-table-wizard math-symbol-lists preview-tailor tex-item tex-parens company-mode company company-auctex company-bibtex company-c-headers company-dict company-emacs-eclim company-go company-nixos-options company-org-block company-shell c-eldoc c-eval c0-mode elpy ac-capf anaconda-mode bash-completion jedi xwidgete org-agenda-property tramp org-roam multishell nix-mode ## package-lint alect-themes org org-auto-tangle org-contacts org-contrib org-drill org-edna org-jami-bot org-journal org-mime org-modern org-notify org-present org-real org-remark org-superstar org-transclusion org-transclusion-http org-translate org-tree-slide orgalist orgit luwak exwm f90-interface-browser auctex auctex-cont-latexmk auctex-label-numbers cdlatex company-math latex-table-wizard math-symbol-lists preview-tailor tex-item tex-paren))

;;;; General Appearance Settings

;; Tab bar
(setq tab-bar-show nil)
(tab-bar-mode 1)
(setq tab-bar-new-tab-choice `eshell)


;; Get rid of bloat
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(setq inhibit-startup-screen t)
(setq initial-buffer-choice `eshell)
(setq-default initial-buffer-choice `eshell)

;; Mode Line Settings
(setq-default mode-line-format (delq `mode-line-modes mode-line-format))
(display-battery-mode 1)
(setq display-time-format "%I:%M:%S %p")
(setq display-time-interval 1)
(display-time-mode)


;; SEARCH FUNCTIONALITY
(setq isearch-regexp-lax-whitespace t)
(setq search-whitespace-regexp "\\s-+")
(setq search-upper-case nil)


;; Usability
(delete-selection-mode 1)
(setq prettify-symbol-mode t)
(setq pop-up-windows nil)


;;;; WINDOW MANAGEMENT

(global-company-mode)

;;Allow Window Restoration
(setq winner-dont-bind-my-keys t) ;stop winner from binding all the good shortcuts
(winner-mode 1)

;;Stupid Major Modes keep over-riding my keybinds, so let's make a minor mode that can't be overwritten

(setq exwm-input-prefix-keys
      `(?\C-x
	?\C-c
	?\M-x
	?\M-&
	?\M-:
	?\s-n))

(setq exwm-input-global-keys
      `(
	(,(kbd "\C-c <left>") . windmove-left)
	(,(kbd "\C-c <right>") . windmove-right)	
	(,(kbd "\C-c <up>") . windmove-up)
	(,(kbd "\C-c <down>") . windmove-down)
	(,(kbd "\C-z") . winner-undo)
	(, (kbd "\C-x \C-b") . buffer-menu)
 	([s-left] . shrink-window-horizontally)
	([s-right] . enlarge-window-horizontally)
	([s-up] . shrink-window)
	([s-down] . enlarge-window)
	([s-tab] . tab-next)
	(,(kbd "s-n") . tab-new)
	(,(kbd "s-1") . (lambda () (interactive) (tab-bar-select-tab 1)))
	(,(kbd "s-2") . (lambda () (interactive) (tab-bar-select-tab 2)))
	(,(kbd "s-3") . (lambda () (interactive) (tab-bar-select-tab 3)))
	(,(kbd "s-4") . (lambda () (interactive) (tab-bar-select-tab 4)))
	(,(kbd "s-5") . (lambda () (interactive) (tab-bar-select-tab 5)))
	))
	

;(defvar my/keys-keymap (make-keymap)
;  "Keymap for my/keys-mode")
;(define-minor-mode my/keys-mode
;  "Minor mode for my personal keybindings so major modes can't keep fucking my shit up."
;  :init-value t
;  :global t
;  :keymap my/keys-keymap)
;(add-to-list `emulation-mode-map-alists
;	     `((my/keys-mode . ,my/keys-keymap)))
;(define-key my/keys-keymap (kbd "\C-c <left>") 'windmove-left)
;(define-key my/keys-keymap (kbd "\C-c <right>") 'windmove-right)
;(define-key my/keys-keymap (kbd "\C-c <up>") 'windmove-up)
;(define-key my/keys-keymap (kbd "\C-c <down>") 'windmove-down)
;(define-key my/keys-keymap (kbd "\C-z") `winner-undo) ;Stop ctrl-z from fucking up emacs
;(define-key my/keys-keymap (kbd "\C-x \C-b") `buffer-menu)
;(define-key my/keys-keymap (kbd "<s-left>") `shrink-window-horizontally)
;(define-key my/keys-keymap (kbd "<s-right>") `enlarge-window-horizontally)
;(define-key my/keys-keymap (kbd "<s-down>") `shrink-window)
;(define-key my/keys-keymap (kbd "<s-up>") `enlarge-window)
;(define-key my/keys-keymap (kbd "<s-tab>") `tab-next)
;(define-key my/keys-keymap (kbd "s-n") `tab-new)
;(define-key my/keys-keymap (kbd "s-1") (lambda () (interactive) (tab-bar-select-tab 1)))
;(define-key my/keys-keymap (kbd "s-2") (lambda () (interactive) (tab-bar-select-tab 2)))
;(define-key my/keys-keymap (kbd "s-3") (lambda () (interactive) (tab-bar-select-tab 3)))
;(define-key my/keys-keymap (kbd "s-4") (lambda () (interactive) (tab-bar-select-tab 4)))
;(define-key my/keys-keymap (kbd "s-5") (lambda () (interactive) (tab-bar-select-tab 5)))




;;;; CUSTOM PROGRAMS

;; Shell Settings
;(setq-default explicit-shell-file-name "/bin/fish")
(setq comint-prompt-read-only t)

;; Markdown Settings
(setq markdown-hide-markup t)

;; ORG MODE VARIABLES
(transient-mark-mode 1)
(setq org-enable-priority-commands t
      org-highest-priority ?A
      org-default-priority ?D
      org-lowest-priority ?G)
;(setq org-roam-directory (file-truename "~/Desktop/OrgFiles"))
(setq find-file-visit-truename t)
;(org-roam-db-autosync-mode)

;CUSTOM HOOK ADDITIONS
(defun startmarkdown ()
  (variable-pitch-mode 1)
  (visual-line-mode t)
  (setq markdown-header-scaling t)
  (setq markdown-enable-math t)
  (setq left-margin-width 12)
  (setq right-margin-width 9)
  )
(add-hook `markdown-mode-hook `startmarkdown)

(add-hook `exwm-update-class-hook
	  (lambda ()
	    (exwm-workspace-rename-buffer exwm-class-name)))

;(add-hook `exwm-update-class-hook
;	  (mode- my/keys-mode))

(defun nomargins ()
  (interactive)
  (setq left-margin-width 0)
  (setq right-margin-width 0)
  )

(defun bigmargins ()
  (interactive)
  (setq left-margin-width 12)
  (setq right-margin-width 9)
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

(defun tab-create (name)
  "Create the NAME tab if it doesn't exist already."
  (condition-case nil
      (unless (equal (alist-get `name (tab-bar--current-tab))
		     name)
	(tab-bar-rename-tab-by-name name name))
    (error (tab-new)
	   (tab-bar-rename-tab name))))

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
   '(s)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(eval-after-load "dired-aux"
   '(add-to-list 'dired-compress-file-suffixes 
                 '("\\.zip\\'" ".zip" "unzip")))


;; Create the initial tabs

(progn (tab-create "2")
       (tab-create "3")
       (tab-create "4")
       (tab-create "5"))
(tab-bar-select-tab 1)
