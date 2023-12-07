(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruvbox-dark-soft))
 '(custom-safe-themes
   '("d80952c58cf1b06d936b1392c38230b74ae1a2a6729594770762dc0779ac66b7" "2ff9ac386eac4dffd77a33e93b0c8236bb376c5a5df62e36d4bfa821d56e4e20" default))
 '(org-agenda-files '("~/Desktop/maynooth-year-3/semester1ToDo.org"))
 '(package-selected-packages
   '(org-modern org-appear lsp-pyright all-the-icons-ivy-rich all-the-icons-ivy all-the-icons ivy-rich counsel vterm ivy lsp-treemacs company-box company org-roam dired-rainbow
		rainbow-delimiters paredit dired-sidebar eat lsp-mode paradox magit consult vertico use-package gruvbox-theme ##))
 '(paradox-automatically-star t)
 '(paradox-github-token t))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-hide ((t (:foreground "#32302f")))))
(setq mac-option-key-is-meta nil
      mac-command-key-is-meta t
      mac-command-modifier 'meta
      mac-option-modifier 'super)


(require 'org)
(setq org-todo-keywords
  '((sequence "TODO" "IN-PROGRESS" "CORRECTING" "DONE")))

(global-set-key (kbd "s-3") '(lambda () (interactive) (insert "#")))
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-x t") 'dired-sidebar-toggle-sidebar)
(global-set-key (kbd "C-x C-t") 'treemacs)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)

(setq org-log-done 'time)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

(add-hook 'org-mode-hook 'org-indent-mode)
(add-hook 'org-mode-hook 'auto-fill-mode)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))


(use-package elec-pair
  :ensure nil
  :hook ((c++-mode . electric-pair-mode)
	 (python-mode . electric-pair-mode)))

(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  
  :commands lsp
  :hook ((c++-mode . lsp-deferred)
	 (js-mode . lsp-deferred)
	 (python-mode . lsp-deferred)))

(use-package company
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0))

(use-package company-box
  :hook (company-mode . company-box-mode))

(use-package lsp-treemacs
  :after lsp)

(use-package cc-mode
  :init
  (setq-default c-basic-offset 4))

(use-package ivy
  :ensure t
  :diminish
  :custom
  (setq ivy-use-virtual-buffers t)
  :config (ivy-mode 1))

(use-package ivy-rich
  :after (:all ivy counsel)
  :ensure t
  :custom
  (ivy-virtual-abbreviate 'full
                          ivy-rich-switch-buffer-align-virtual-buffer t
                          ivy-rich-path-style 'abbrev)
  :config
  (ivy-rich-mode 1))
  
(use-package counsel
  :after ivy
  :config (counsel-mode))

(use-package swiper
  :after ivy
  :bind (("C-s" . swiper)
         ("C-r" . swiper)))

(use-package all-the-icons-ivy-rich
  :ensure t
  :init (all-the-icons-ivy-rich-mode 1))

(use-package org
  :ensure t
  :config
  (setq-default org-startup-indented t
                org-pretty-entities t
                org-use-sub-superscripts "{}"
                org-hide-emphasis-markers t
                org-startup-with-inline-images t
                org-image-actual-width '(300)))

(use-package org-appear
    :hook
    (org-mode . org-appear-mode))

(use-package org-modern
    :hook
    (org-mode . global-org-modern-mode)
    :custom
    (org-modern-keyword nil)
    (org-modern-checkbox nil)
    (org-modern-table nil)
    (modus-themes-load-operandi))


(set-face-attribute 'default nil :height 130)

