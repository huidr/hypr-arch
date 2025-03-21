;; ===========================================
;; Emacs configuration file (incomplete)
;; Check other .el files in the same directory
;; ===========================================

;; (setq inhibit-startup-message t) ;; Disable startup screen
(global-display-line-numbers-mode t) ;; Show line numbers

;; Line numbering only when editing code
;; (add-hook 'prog-mode-hook 'display-line-numbers-mode) 

;; Automatic line wrapping at 80 characters in text mode
(add-hook 'text-mode-hook 'auto-fill-mode)

;; ==================
;; Set up use-package
;; ==================

(require 'package)
;; Enable MELPA
;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")            ;; MELPA
	("gnu" . "https://elpa.gnu.org/packages/")           ;; GNU ELPA
	("nongnu" . "https://elpa.nongnu.org/nongnu/")))     ;; nonGNU ELPA
(package-initialize)

;; Install use-package if not installed already
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t) ;; Auto-install missing packages

;; ==========================
;; Packages using use-package
;; ==========================

;; (use-package nim-mode) 

;; =======================
;; Customs (M-x customize)
;; =======================

;; Reinstall missing packages
;;(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
;; '(package-selected-packages nil))

;; Changes in UI elements, themes or font sizes
;; made using M-x customize are saved here
;; (custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
;; )
