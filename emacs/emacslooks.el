;; Emacs Looks

;; Set size and place of Emacs session on desktop
(setq default-frame-alist
      '((width . 105)           ;; number of characters
	(height . 90)
	(top . 50)
	(left . 320)))

;; Themes
(add-to-list 'load-path "~/.emacs.d/lisp/doom-themes/") ;; doom-themes should be in this directory
(require 'doom-themes)
(setq doom-themes-enable-bold t
      doom-themes-enable-italic t)

;; Load theme
(load-theme 'doom-one t)

;; some pretty icons
(add-to-list 'load-path "~/.emacs.d/lisp/all-the-icons/") ;; available at MELPA
(require 'all-the-icons)
;; after installation, run M-x all-the-icons-install-fonts

;; Set font
(set-frame-font "Iosevka-16" t t) ;; font is installed separately

;; dashboard
(add-to-list 'load-path "~/.emacs.d/lisp/dashboard/") ;; available at MELPA
(require 'dashboard)
(dashboard-setup-startup-hook)
(setq dashboard-banner-logo-title "Emacs")  ;; Startup title
(setq dashboard-startup-banner '2)  ;; Display the Emacs logo
(setq dashboard-center-content t)  ;; Center the content
(setq dashboard-show-time t)  ;; Display current time
(setq dashboard-set-heading-icons t)  ;; Show icons next to headings
(setq dashboard-heading-font-size 1)  ;; Set the font size of headings
(setq dashboard-set-file-icons t)     ;; Enable file icons
;; Footer message (can also include keybindings)
(setq dashboard-footer-messages
      '("One editor to rule them all"
	"Let's get to business"
	"An operating system"))
