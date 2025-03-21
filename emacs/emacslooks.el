;; ====================================
;; Emacs looks (a part of init.el file)
;; Assumes use-package is loaded
;; ====================================

;; Set size and place of Emacs session on desktop
(setq default-frame-alist
      '((width . 105)           ;; Sets the number of characters
	(height . 90)
	(top . 50)
	(left . 320)))

;; Themes
(use-package doom-themes
  :ensure t
  :init                         ;; Runs before the package is loaded
  (setq doom-themes-enable-bold t
	doom-themes-enable-italic t)
  :config                       ;; Runs after the package is loaded
  (load-theme 'doom-one t)
  (doom-themes-org-config))     ;; Improved org-mode styling
  
;; Some pretty icons
(use-package all-the-icons
  :ensure t)
;; after installation, run M-x all-the-icons-install-fonts

;; Set font
(set-frame-font "Iosevka-16" t t) ;; font is installed separately

;; Dashboard: Startup screen
(use-package dashboard
  :ensure t
  :config
  (setq dashboard-startup-banner 'logo
	dashboard-banner-logo-title "Emacs"
	dashboard-center-content t
	dashboard-show-time t
	dashboard-set-heading-icons nil
	dashboard-heading-font-size 1
	dashboard-set-file-icons nil
	dashboard-footer-messages '("One editor to rule them all"
				    "Let's get to business"
				    "An operating system"))
   (dashboard-setup-startup-hook))
