;; Configure org-mode
;; This is a part of the emacs init file

(add-hook 'org-mode-hook 'variable-pitch-mode)
(add-hook 'org-mode-hook 'visual-line-mode) ;; Enable word wrapping

;; Customize the headings
(custom-set-faces
 '(org-level-1 ((t (:inherit outline-1 :height 1.8 :weight bold :foreground "#ff79c6"))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.5 :weight bold :foreground "#8be9fd"))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.3 :weight bold :foreground "#50fa7b"))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.1 :weight bold :foreground "#f1fa8c")))))

;; Replace * of headings with emojis
(add-to-list 'load-path "~/.emacs.d/lisp/org-superstar/") ;; org-superstar is available at MELPA
(require 'org-superstar)
(add-hook 'org-mode-hook 'org-superstar-mode)
(setq org-superstar-headline-bullets-list
      (list (char-to-string #x273F)          ;; heading level 1
            (char-to-string #x2740)          ;; heading level 2
            (char-to-string #x2726)          ;; heading level 3
            (char-to-string #x2742)))        ;; heading level 4

(add-hook 'org-mode-hook 'org-indent-mode) ;; Indent headings
(setq org-hide-leading-stars t) ;; Hide extra leading stars

;; Pretty quote blocks
(custom-set-faces
 '(org-block ((t (:background "#282a36" :foreground "#f8f8f2" :slant italic)))))

;; Force monospace for tables to self-align
(custom-set-faces
 '(org-table ((t (:inherit fixed-pitch)))))

;; Define header function; to insert a template header to a new org file
(defun org-header()
  "to insert a line"
  (interactive)
  (insert "#+TITLE: \n")
  (insert "#+AUTHOR: \n")
  (insert "#+EMAIL: ronhuidrom@gmail.com")
  (insert "#+DATE: \n")
  (insert "#+STARTUP: overview\n")         ;; start with all headings collapsed, not "showall"
  (insert "#+STARTUP: indent\n\n")         ;; visually indent headings for readability
  (insert "#+OPTIONS: toc: 2\n")           ;; table of contents, level 2
  (insert "#+LATEX_CLASS: article\n")
  (insert "#+LATEX_CLASS_OPTIONS: [a4paper, 12pt]\n")
  (insert "#+LATEX_HEADER: \\usepackage[margin=1.2in]{geometry}\n")
  (insert "#+REVEAL_ROOT: https://cdn.jsdelivr.net/npm/reveal.js\n"))   ;; to use Reveal.js

;; Keybindings
(with-eval-after-load 'org
  (define-key org-mode-map (kbd "C-c h")
    'org-header))

;; The following are default keybindings
;;
;; C-c C-n    Next heading
;; C-c C-p    Previous heading
;; C-c C-f    Next heading at the same level
;; C-c C-b    Previous heading at the same level
;; C-c C-u    Move up to the parent heading
;;
;; C-c C-l    Insert a link
;; C-c C-l *HeadingName    Insert an internal link to a heading: [[*Heading]]
;; C-c C-o    Open a link
;; C-c C-l    (on a link) Edit link
;;
;; C-c C-e    Export menu
