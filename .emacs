(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

(package-initialize)

(custom-set-variables
 '(custom-enabled-themes (quote (wombat))))
(custom-set-faces)

(require 'flycheck)
(add-hook 'js-mode-hook
          (lambda () (flycheck-mode t)))
;;(add-hook 'LaTeX-mode-hook 'flycheck-mode)

(show-paren-mode 1)
(global-linum-mode 1)

(add-hook 'term-setup-hook
          (lambda () (define-key input-decode-map "\e[Z" [backtab])))

(setq-default indent-tabs-mode t)
(setq-default tab-width 4) ; Assuming you want your tabs to be four spaces wide

(global-set-key (kbd "M-d") 'backward-kill-word)
(global-set-key (kbd "C-d") 'delete-backward-char)
;;(global-set-key (kbd "C-D") 'backward-kill-line)
(global-set-key (kbd "C-z") 'undo) 
;;(global-set-key (kbd "C-Z") 'redo)  
(global-set-key (kbd "C-x C-h") (lambda() (interactive)(find-file "/home/kim/")))
(global-set-key (kbd "C-x C-r") (lambda() (interactive)(find-file "/")))
(global-set-key (kbd "<f10>") (lambda() (interactive)(find-file "/home/kim/Dropbox/org/")))

(global-set-key [S-dead-grave] "`")
(global-set-key [S-dead-acute] "`")


(require 'erlang-start)

(require 'yasnippet)
(yas-global-mode 1)

(require 'autopair)
(autopair-global-mode) ;; enable autopair in all buffers

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode)) 
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode)) 
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode)) 
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode)) 
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode)) 
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.handlebars?\\'" . web-mode))

(defun my-setup-php ()
  ;; enable web mode
  (web-mode)

)

(add-to-list 'auto-mode-alist '("\\.php$" . my-setup-php))

;;(add-hook 'after-init-hook #'global-flycheck-mode)


;; LaTeX configuration
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'TeX-source-correlate-mode)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(setq TeX-PDF-mode t)

(setq TeX-output-view-style
    (quote
     (("^pdf$" "." "evince -f %o")
      ("^html?$" "." "iceweasel %o"))))

(global-set-key
 [f3]
 (lambda ()
   (interactive)
   (ispell-change-dictionary "english")))

(global-set-key [f2] 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)

(add-hook 'org-mode-hook (lambda () (setq ispell-parser 'tex)))

;;XeLaTeX
(custom-set-variables
 '(TeX-command-list (quote (("XeLaTeX_SyncteX" "%`xelatex --synctex=1%(mode)%' %t" TeX-run-TeX nil (latex-mode doctex-mode) :help "Run XeLaTeX") ("TeX" "%(PDF)%(tex) %`%S%(PDFout)%(mode)%' %t" TeX-run-TeX nil (plain-tex-mode texinfo-mode ams-tex-mode) :help "Run plain TeX") ("LaTeX" "%`%l%(mode)%' %t" TeX-run-TeX nil (latex-mode doctex-mode) :help "Run LaTeX") ("Makeinfo" "makeinfo %t" TeX-run-compile nil (texinfo-mode) :help "Run Makeinfo with Info output") ("Makeinfo HTML" "makeinfo --html %t" TeX-run-compile nil (texinfo-mode) :help "Run Makeinfo with HTML output") ("AmSTeX" "%(PDF)amstex %`%S%(PDFout)%(mode)%' %t" TeX-run-TeX nil (ams-tex-mode) :help "Run AMSTeX") ("ConTeXt" "texexec --once --texutil %(execopts)%t" TeX-run-TeX nil (context-mode) :help "Run ConTeXt once") ("ConTeXt Full" "texexec %(execopts)%t" TeX-run-TeX nil (context-mode) :help "Run ConTeXt until completion") ("BibTeX" "bibtex %s" TeX-run-BibTeX nil t :help "Run BibTeX") ("View" "%V" TeX-run-discard-or-function nil t :help "Run Viewer") ("Print" "%p" TeX-run-command t t :help "Print the file") ("Queue" "%q" TeX-run-background nil t :help "View the printer queue" :visible TeX-queue-command) ("File" "%(o?)dvips %d -o %f " TeX-run-command t t :help "Generate PostScript file") ("Index" "makeindex %s" TeX-run-command nil t :help "Create index file") ("Check" "lacheck %s" TeX-run-compile nil (latex-mode) :help "Check LaTeX file for correctness") ("Spell" "(TeX-ispell-document \"\")" TeX-run-function nil t :help "Spell-check the document") ("Clean" "TeX-clean" TeX-run-function nil t :help "Delete generated intermediate files") ("Clean All" "(TeX-clean t)" TeX-run-function nil t :help "Delete generated intermediate and output files") ("Other" "" TeX-run-command t t :help "Run an arbitrary command") ("Jump to PDF" "%V" TeX-run-discard-or-function nil t :help "Run Viewer"))))
 '(TeX-modes (quote (tex-mode plain-tex-mode texinfo-mode latex-mode doctex-mode)))
)

(add-hook 'LaTeX-mode-hook
      (lambda()
        (local-set-key (kbd "C-1") 'TeX-complete-symbol)))

;; Setting up writegood-mode
;;(require 'writegood-mode)
;;(global-set-key (kbd "C-1") 'writegood-mode)


(defun toggle-maximize-buffer () "Maximize buffer"
  (interactive)
  (if (= 1 (length (window-list)))
      (jump-to-register '_) 
    (progn
      (window-configuration-to-register '_)
      (delete-other-windows))))

(global-set-key (kbd "C-c ?") 'toggle-maximize-buffer) 

(defun shell-mode-hook () (interactive)
      (local-set-key (kbd "C-c l") 'erase-buffer))

(defun tilde () (interactive) (insert "~"))

(global-set-key (kbd "M-C-¨") 'tilde) 


(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)

;; disable the gui.  Who uses emacs for toolbars and menus?
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(setq menu-prompting nil)

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)


; source: http://steve.yegge.googlepages.com/my-dot-emacs-file
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file name new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))

(global-set-key (kbd "C-c n") 'rename-file-and-buffer)


;; move buffer
(defun move-buffer-file (dir)
  "Moves both current buffer and file it's visiting to DIR."
  (interactive "DNew directory: ")
  (let* ((name (buffer-name))
	 (filename (buffer-file-name))
	 (dir
	  (if (string-match dir "\\(?:/\\|\\\\)$")
	      (substring dir 0 -1) dir))
	 (newname (concat dir "/" name)))
    (if (not filename)
	(message "Buffer '%s' is not visiting a file!" name)
	(progn (copy-file filename newname 1)
	       (delete-file filename)
	       (set-visited-file-name newname)
	       (set-buffer-modified-p nil)
	       t))))

(global-set-key (kbd "C-c m") 'move-buffer-file)



(defun revert-all-buffers ()
  "Refreshes all open buffers from their respective files"
  (interactive)
  (mapc (lambda (buffer)
	  (when (and (buffer-file-name buffer)
		     (not (buffer-modified-p buffer)))
	    (set-buffer buffer)
	    (ignore-errors (revert-buffer t t t))))
	(buffer-list))
  (message "Refreshed open files"))

(global-set-key (kbd "C-c q") 'revert-all-buffers)



(defun close-all-buffer ()
  "Closes all the buffers."
  (interactive)
  (mapc (lambda (buffer) (kill-buffer buffer)) (buffer-list)))

(global-set-key (kbd "C-c ESC") 'close-all-buffer)


(defun delete-file-and-buffer ()
  "Kill the current buffer and deletes the file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (when filename
      (if (vc-backend filename)
          (vc-delete-file filename)
        (progn
          (delete-file filename)
          (message "Deleted file %s" filename)
          (kill-buffer))))))

(global-set-key (kbd "C-c d") 'delete-file-and-buffer)

;;Create necessary dirs automaticly
(defadvice find-file (before make-directory-maybe (filename &optional wildcards) activate)
  "Create parent directory if not exists while visiting file."
  (unless (file-exists-p filename)
    (let ((dir (file-name-directory filename)))
      (unless (file-exists-p dir)
        (make-directory dir)))))


(global-set-key (kbd "<f2>") 'ansi-term)


(defun copy-current-file-path ()
  "Add current file path to kill ring. Limits the filename to project root if possible."
  (interactive)
  (let ((filename (buffer-file-name)))
    (kill-new (if eproject-mode
                  (s-chop-prefix (eproject-root) filename)
                filename))))

(global-set-key (kbd "C-c c") 'copy-current-file-path)




; https://hugoheden.wordpress.com/2009/03/08/copypaste-with-emacs-in-terminal/
;; I prefer using the "clipboard" selection (the one the
;; typically is used by c-c/c-v) before the primary selection
;; (that uses mouse-select/middle-button-click)
(setq x-select-enable-clipboard t)

;; If emacs is run in a terminal, the clipboard- functions have no
;; effect. Instead, we use of xsel, see
;; http://www.vergenet.net/~conrad/software/xsel/ -- "a command-line
;; program for getting and setting the contents of the X selection"
(unless window-system
 (when (getenv "DISPLAY")
  ;; Callback for when user cuts
  (defun xsel-cut-function (text &optional push)
    ;; Insert text to temp-buffer, and "send" content to xsel stdin
    (with-temp-buffer
      (insert text)
      ;; I prefer using the "clipboard" selection (the one the
      ;; typically is used by c-c/c-v) before the primary selection
      ;; (that uses mouse-select/middle-button-click)
      (call-process-region (point-min) (point-max) "xsel" nil 0 nil "--clipboard" "--input")))
  ;; Call back for when user pastes
  (defun xsel-paste-function()
    ;; Find out what is current selection by xsel. If it is different
    ;; from the top of the kill-ring (car kill-ring), then return
    ;; it. Else, nil is returned, so whatever is in the top of the
    ;; kill-ring will be used.
    (let ((xsel-output (shell-command-to-string "xsel --clipboard --output")))
      (unless (string= (car kill-ring) xsel-output)
	xsel-output )))
  ;; Attach callbacks to hooks
  (setq interprogram-cut-function 'xsel-cut-function)
  (setq interprogram-paste-function 'xsel-paste-function)
  ;; Idea from
  ;; http://shreevatsa.wordpress.com/2006/10/22/emacs-copypaste-and-x/
  ;; http://www.mail-archive.com/help-gnu-emacs@gnu.org/msg03577.html
 ))



(require 'org)
;;(define-key global-map "\C-cl" 'org-store-link)
;;(define-key global-map "\C-ca" 'org-agenda)
(global-set-key (kbd "<f12>") 'org-agenda)
;;(global-set-key (kbd "<f11>") 'org-show-todo-tree org-mode-map)
(global-set-key (kbd "<f11>") 'org-agenda-list)
(setq org-log-done t)
(setq org-agenda-files (list "/home/kim/Dropbox/org/refile.org"
                             "/home/kim/Dropbox/org/class.org"))
;; Unbind prelude rename command
;;(global-unset-key "\C-cr")
;;(setq org-default-notes-file (concat org-directory "/notes.org"))
(define-key global-map "\C-cp" 'org-capture)


(defun org-capture-class ()
  "Capture a class template for org-capture."
  (cl-labels ((update (date days)
                      (format-time-string
                       (car org-time-stamp-formats)
                       (seconds-to-time (+ (time-to-seconds date)
                                           (* days 86400))))))
    (let ((course   (read-string "Course: " nil nil '(nil)))
          (week     (read-string "Week: " nil nil '(nil)))
          (lecture  (read-string "Lecture No.: " nil nil '(nil)))
          (date     (org-read-date nil t))
          (location (read-string "Location: " nil nil '(nil))))
      (when (and course week lecture date location)
        (concat (format "* TODO %s: Week %s Lecture %s\n"
                        course week lecture)
                (format "  SCHEDULED: %s\n" (update date 0))
                (format "  Location: %s %%?\n" location)
                (format "** TODO %s: prepare lecture %s from week %s\n"
                        course lecture week)
                (format "   DEADLINE: %s SCHEDULED: %s\n"
                        (update date -1) (update date -2))
                (format "** TODO %s: review lecture %s from week %s\n"
                        course lecture week)
                (format "   DEADLINE: %s SCHEDULED: %s\n"
                        (update date 2) (update date 1)))))))


(setq org-capture-templates
      '(("j" "Journal Entry" plain
         (file+datetree "/home/kim/Dropbox/org/journal.org")
         "%U\n\n%?" :empty-lines-before 1)
	("t" "todo entry in refile " entry (file+headline "/home/kim/Dropbox/org/refile.org" "Tasks")
    "* TODO %?\n  %i\n" )
	 ("n" "note" entry (file+headline "/home/kim/Dropbox/org/refile.org" "Notes")
    "* %?\n  %i\n" )
	 ("c" "Class" entry
      (file "/home/kim/Dropbox/org/class.org")
      #'org-capture-class)
     ("e" "Exercise session" entry
      (file "/home/kim/Dropbox/org/class.org"))))

(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)



;;Configure Outbound Mail

;;Tell the program who you are

(setq user-full-name "Kim Hammar")
(setq user-mail-address "kim.hammar1994@gmail.com")

;;Tell Emacs to use GNUTLS instead of STARTTLS
;;to authenticate when sending mail.

(setq starttls-use-gnutls t)

;;Tell Emacs about your mail server and credentials

(setq send-mail-function 'smtpmail-send-it
message-send-mail-function 'smtpmail-send-it
smtpmail-starttls-credentials
'(("smtp.gmail.com" 587 nil nil))
smtpmail-auth-credentials
(expand-file-name "~/.authinfo")
smtpmail-default-smtp-server "smtp.gmail.com"
smtpmail-smtp-server "smtp.gmail.com"
smtpmail-smtp-service 587
smtpmail-debug-info t)
(require 'smtpmail)


;;; Set some sane defaults for VM’s replies and forwarding
(setq
 vm-forwarding-subject-format "[forwarded from %F] %s"
 vm-forwarding-digest-type "rfc934"
 vm-in-reply-to-format nil
 vm-included-text-attribution-format
 "On %w, %m %d, %y at %h (%z), %F wrote:n"
 vm-reply-subject-prefix "Re: "
 vm-mail-header-from "Kim Hammar <kim.hammar1994@gmail.com>"
 )
(setq compose-mail-check-user-agent nil)




;; the exact path may differ -- check it
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e")
(require 'mu4e)

;; default
;; (setq mu4e-maildir "~/Maildir")

(setq mu4e-drafts-folder "/[Gmail].Drafts")
(setq mu4e-sent-folder   "/[Gmail].Sent Mail")
(setq mu4e-trash-folder  "/[Gmail].Trash")

;; don't save message to Sent Messages, Gmail/IMAP takes care of this
(setq mu4e-sent-messages-behavior 'delete)

;; (See the documentation for `mu4e-sent-messages-behavior' if you have
;; additional non-Gmail addresses and want assign them different
;; behavior.)

;; setup some handy shortcuts
;; you can quickly switch to your Inbox -- press ``ji''
;; then, when you want archive some messages, move them to
;; the 'All Mail' folder by pressing ``ma''.

(setq mu4e-maildir-shortcuts
    '( ("/INBOX"               . ?i)
       ("/[Gmail].Sent Mail"   . ?s)
       ("/[Gmail].Trash"       . ?t)
       ("/[Gmail].All Mail"    . ?a)))

;; allow for updating mail using 'U' in the main view:
(setq mu4e-get-mail-command "offlineimap")

;; something about ourselves
(setq
   user-mail-address "kim.hammar1994@gmail.com"
   user-full-name  "Kim Hammar"
   mu4e-compose-signature
    (concat
      "Kim Hammar\n"
      "http://limmen.github.io/Personal-website/\n"))

;; sending mail -- replace USERNAME with your gmail username
;; also, make sure the gnutls command line utils are installed
;; package 'gnutls-bin' in Debian/Ubuntu

(require 'smtpmail)
(setq message-send-mail-function 'smtpmail-send-it
   starttls-use-gnutls t
   smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
   smtpmail-auth-credentials
     '(("smtp.gmail.com" 587 "kim.hammar1994@gmail.com" nil))
   smtpmail-default-smtp-server "smtp.gmail.com"
   smtpmail-smtp-server "smtp.gmail.com"
   smtpmail-smtp-service 587)

;; alternatively, for emacs-24 you can use:
;;(setq message-send-mail-function 'smtpmail-send-it
;;     smtpmail-stream-type 'starttls
;;     smtpmail-default-smtp-server "smtp.gmail.com"
;;     smtpmail-smtp-server "smtp.gmail.com"
;;     smtpmail-smtp-service 587)

;; don't keep message buffers around
(setq message-kill-buffer-on-exit t)
