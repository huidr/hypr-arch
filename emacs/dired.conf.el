;; Configure dired
;; The following may be put in emacs config file

;; Create a new file
(defun my/dired-create-file (filename)
  "Create a new file named FILENAME in the current dired directory."
  (interactive (list (read-file-name "New file: " (dired-current-directory))))
  (let ((full-path (expand-file-name filename (dired-current-directory))))
    (if (file-exists-p full-path)
	(message "File already exists")
      (write-region "" nil full-path)
      (dired-add-file full-path)
      (revert-buffer))))

;; Open the current directory in the GUI file manager
(defun open-in-file-manager ()
  "Open the current directory in the system's GUI file manager."
  (interactive)
  (let ((path (shell-quote-argument (expand-file-name default-directory))))
    (cond ((eq system-type 'windows-nt)
	   (shell-command (concat "explorer " (replace-regexp-in-string "/" "\\" path t t))))
	  ((eq system-type 'darwin)
	   (shell-command (concat "open " path)))
	  ((eq system-type 'gnu/linux)
	   (shell-command (concat "xdg-open " path))))))

;; Open files in their default application
(defun dired-open-file ()
  "Open the file at point in its default external application, but open text files inside Emacs. If a directory is selected, enter it as usual."
  (interactive)
  (let ((file (dired-get-file-for-visit)))
    (cond
     ;; if it's a directory, open it in dired
     ((file-directory-p file)
      (dired-find-file))
     ;; if It's a text file, open it in Emacs
     ((string-match-p (rx (or
			   ".txt" ".md" ".org" ".el" ".py" ".rs" ".java" ".cpp" ".h" ".c")
			  eos)
		      file)
      (find-file file))
     ;; otherwise, open it externally
     (t 
      (cond ((eq system-type 'windows-nt)
	     (shell-command (concat "start \"\"" (shell-quote-argument file))))
	    ((eq system-type 'darwin)
	     (shell-command (concat "open " (shell-quote-argument file))))
	    ((eq system-type 'gnu/linux)
	     (shell-command (concat "xdg-open " (shell-quote-argument file)))))))))

;; Key bindings
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "N")       ;; N          create a new file
    'my/dired-create-file)
  (define-key dired-mode-map (kbd "C-c o")   ;; C-c o      open the current directory in GUI file manager
    #'open-in-file-manager)
  (define-key dired-mode-map (kbd "RET")     ;; RET        open files in their default application
    #'dired-open-file))

;; Default keybindings
;; C-x d    dired mode
;; ^        Move one directory up
;; d        Mark for delete
;; x        Delete the marked items
;; D        Delete
;; +        Create a new directory
;; R        Rename directory/file
;; C        Copy
