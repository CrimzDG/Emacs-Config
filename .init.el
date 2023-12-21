(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruvbox-dark-soft))
 '(custom-safe-themes
   '("e3daa8f18440301f3e54f2093fe15f4fe951986a8628e98dcd781efbec7a46f2" "d80952c58cf1b06d936b1392c38230b74ae1a2a6729594770762dc0779ac66b7" "2ff9ac386eac4dffd77a33e93b0c8236bb376c5a5df62e36d4bfa821d56e4e20" default))
 '(org-agenda-files nil)
 '(package-selected-packages
   '(doom-themes doom-modeline dashboard page-break-lines projectile beacon nerd-icons all-the-icons-dired org-modern org-appear lsp-pyright all-the-icons-ivy-rich all-the-icons-ivy all-the-icons ivy-counsel rich vterm ivy lsp-treemacs company-box company org-roam dired-rainbow rainbow-delimiters paredit dired-sidebar eat lsp-mode paradox magit consult vertico use-package gruvbox-theme ##))
 '(paradox-automatically-star t)
 '(paradox-github-token t))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-hide ((t (:foreground "#32302f"))))
 '(org-modern-done-face ((t (:foreground "#8ec07c" :box (:line-width 2 :style released-button))))))
(setq mac-option-key-is-meta nil
      mac-command-key-is-meta t
      mac-command-modifier 'meta
      mac-option-modifier 'super)


(require 'org)
(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "CORRECTING" "DONE")))

(setq org-modern-todo-faces
       '(("DONE" . (:foreground "#3c3836" :background "#8ec07c" :weight bold))))

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

(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

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
		org-src-fontify-natively t
                org-image-actual-width '(300))
  (custom-set-faces
   '(org-block ((t (:background "#3c3836" :extend t))))
   '(org-block-begin-line ((t (:background "#282828" :extend t))))
   '(org-block-end-line ((t (:background "#282828" :extend t))))
   '(org-meta-line ((t (:foreground "#fe8019" :extend t))))
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t)))))

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
    (modus-themes-load-operandi)
    (org-modern-todo-faces
	  '(("DONE" . (:foreground "#3c3836" :background "#8ec07c" :weight bold)))))

(use-package beacon
  :config
  (beacon-mode))

;Start Screen, need to setup icons
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  :custom
  (dashboard-set-navigator t)
  (dashboard-center-content t)
  (dashboard-display-icons-p t)
  (dashboard-icon-type 'nerd-icons)
  (dashboard-set-heading-icons t)
  (dashboard-set-file-icons t)
  (dashboard-image-banner-max-height 250)
  (dashboard-startup-banner "/Users/georgemican/images-wallpapers/ue-colorful.png"))
 
 
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom
  (doom-modeline-height 26))
 
 
(set-face-attribute 'default nil :height 130)

