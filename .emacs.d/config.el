
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)

(require 'erlang-start)
(require 'yasnippet)
(require 'autopair)
(require 'web-mode)
(require 'ibuffer)
(require 'org)
;(require 'ecb-autoloads)
(require 'ace-jump-mode)
;;(require 'ido)
(require 'ido-vertical-mode)
(require 'smex)
(require 'ido-hacks nil t)
(require 'fill-column-indicator)
;(require 'python-mode)
(require 'gnuplot-mode)
(require 'dired+)
(require 'figlet)
(require 'cc-mode) 
;;(require 'auto-complete-clang)

(show-paren-mode 1)
(global-linum-mode 1)
(nyan-mode 1)
;;(auto-complete-mode 1)
(global-visual-line-mode t)
(ido-mode 1)
(ido-vertical-mode 1)
(autopair-global-mode) ;; enable autopair in all buffers
(yas-global-mode 1)
;; make indentation commands use space only (never tab character)
(setq-default indent-tabs-mode nil) ; emacs 23.1, 24.2, default to t
(setq-default tab-width 4) ; Assuming you want your tabs to be four spaces wide

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-command-list (quote (("XeLaTeX_SyncteX" "%`xelatex --synctex=1%(mode)%' %t" TeX-run-TeX nil (latex-mode doctex-mode) :help "Run XeLaTeX") ("TeX" "%(PDF)%(tex) %`%S%(PDFout)%(mode)%' %t" TeX-run-TeX nil (plain-tex-mode texinfo-mode ams-tex-mode) :help "Run plain TeX") ("LaTeX" "%`%l%(mode)%' %t" TeX-run-TeX nil (latex-mode doctex-mode) :help "Run LaTeX") ("Makeinfo" "makeinfo %t" TeX-run-compile nil (texinfo-mode) :help "Run Makeinfo with Info output") ("Makeinfo HTML" "makeinfo --html %t" TeX-run-compile nil (texinfo-mode) :help "Run Makeinfo with HTML output") ("AmSTeX" "%(PDF)amstex %`%S%(PDFout)%(mode)%' %t" TeX-run-TeX nil (ams-tex-mode) :help "Run AMSTeX") ("ConTeXt" "texexec --once --texutil %(execopts)%t" TeX-run-TeX nil (context-mode) :help "Run ConTeXt once") ("ConTeXt Full" "texexec %(execopts)%t" TeX-run-TeX nil (context-mode) :help "Run ConTeXt until completion") ("BibTeX" "bibtex %s" TeX-run-BibTeX nil t :help "Run BibTeX") ("View" "%V" TeX-run-discard-or-function nil t :help "Run Viewer") ("Print" "%p" TeX-run-command t t :help "Print the file") ("Queue" "%q" TeX-run-background nil t :help "View the printer queue" :visible TeX-queue-command) ("File" "%(o?)dvips %d -o %f " TeX-run-command t t :help "Generate PostScript file") ("Index" "makeindex %s" TeX-run-command nil t :help "Create index file") ("Check" "lacheck %s" TeX-run-compile nil (latex-mode) :help "Check LaTeX file for correctness") ("Spell" "(TeX-ispell-document \"\")" TeX-run-function nil t :help "Spell-check the document") ("Clean" "TeX-clean" TeX-run-function nil t :help "Delete generated intermediate files") ("Clean All" "(TeX-clean t)" TeX-run-function nil t :help "Delete generated intermediate and output files") ("Other" "" TeX-run-command t t :help "Run an arbitrary command") ("Jump to PDF" "%V" TeX-run-discard-or-function nil t :help "Run Viewer"))))
 '(TeX-modes (quote (tex-mode plain-tex-mode texinfo-mode latex-mode doctex-mode)))
 '(ansi-color-names-vector ["#272822" "#F92672" "#A6E22E" "#E6DB74" "#66D9EF" "#FD5FF0" "#A1EFE4" "#F8F8F2"])
 '(compilation-message-face (quote default))
; '(custom-enabled-themes (quote (monokai)))
 '(custom-safe-themes (quote ("f0d8af755039aa25cd0792ace9002ba885fd14ac8e8807388ab00ec84c9497d7" "a041a61c0387c57bb65150f002862ebcfe41135a3e3425268de24200b82d6ec9" "6a9606327ecca6e772fba6ef46137d129e6d1888dcfc65d0b9b27a7a00a4af20" default)))
 '(fci-rule-color "#49483E")
 '(highlight-changes-colors ("#FD5FF0" "#AE81FF"))
 '(highlight-tail-colors (("#49483E" . 0) ("#67930F" . 20) ("#349B8D" . 30) ("#21889B" . 50) ("#968B26" . 60) ("#A45E0A" . 70) ("#A41F99" . 85) ("#49483E" . 100)))
 '(magit-diff-use-overlays nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map (quote ((20 . "#F92672") (40 . "#CF4F1F") (60 . "#C26C0F") (80 . "#E6DB74") (100 . "#AB8C00") (120 . "#A18F00") (140 . "#989200") (160 . "#8E9500") (180 . "#A6E22E") (200 . "#729A1E") (220 . "#609C3C") (240 . "#4E9D5B") (260 . "#3C9F79") (280 . "#A1EFE4") (300 . "#299BA6") (320 . "#2896B5") (340 . "#2790C3") (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list (unspecified "#272822" "#49483E" "#A20C41" "#F92672" "#67930F" "#A6E22E" "#968B26" "#E6DB74" "#21889B" "#66D9EF" "#A41F99" "#FD5FF0" "#349B8D" "#A1EFE4" "#F8F8F2" "#F8F8F0")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; LaTeX configuration
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'TeX-source-correlate-mode)

(add-hook 'LaTeX-mode-hook
          (lambda () (local-set-key (kbd "C-c b") "\textbf{}")))
(add-hook 'LaTeX-mode-hook
          (lambda () (local-set-key (kbd "C-c i") "\textit{}")))

(add-hook 'LaTeX-mode-hook
          (lambda () (local-set-key (kbd "C-c g") "\includegraphics[scale=1]{.png}")))

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

(setq TeX-PDF-mode t)

(setq TeX-output-view-style
    (quote
     (("^pdf$" "." "evince -f %o")
      ("^html?$" "." "iceweasel %o"))))

(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'org-mode-hook (lambda () (setq ispell-parser 'tex)))
;;XeLaTeX
(add-hook 'LaTeX-mode-hook
      (lambda()
        (local-set-key (kbd "C-1") 'TeX-complete-symbol)))

(add-hook 'js-mode-hook
          (lambda () (flycheck-mode t)))

(add-hook 'term-setup-hook
          (lambda () (define-key input-decode-map "\e[Z" [backtab])))

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

;;(setq ecb-layout-name "left2")

(smex-initialize)

; use IPython
(setq-default py-shell-name "ipython")
(setq-default py-which-bufname "IPython")
; use the wx backend, for both mayavi and matplotlib
(setq py-python-command-args
 '("--gui=wx" "--pylab=wx" "-colors" "Linux"))
(setq py-force-py-shell-name-p t)

; switch to the interpreter after executing code
(setq py-shell-switch-buffers-on-execute-p t)
(setq py-switch-buffers-on-execute-p t)
; don't split windows
(setq py-split-windows-on-execute-p nil)
; try to automagically figure out indentation
(setq py-smart-indentation t)

;;(define-key c++-mode-map (kbd "C-S-<tab>") 'ac-complete-clang)
 (setq-default c-basic-offset 4)

(add-to-list 'auto-mode-alist '("\\.erl?$" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.hrl?$" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.yaws?$" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.escript?$" . erlang-mode))

(add-to-list 'auto-mode-alist '("\\.pl?$" . prolog-mode))

(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode)) 
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode)) 
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode)) 
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode)) 
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode)) 
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.handlebars?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . web-mode))

(defun my-setup-php ()
  ;; enable web mode
  (web-mode))
(add-to-list 'auto-mode-alist '("\\.php$" . my-setup-php))

(defun toggle-maximize-buffer () "Maximize buffer"
  (interactive)
  (if (= 1 (length (window-list)))
      (jump-to-register '_) 
    (progn
      (window-configuration-to-register '_)
      (delete-other-windows))))

(setq org-log-done t)
(setq org-agenda-files (list "/home/kim/Dropbox/org/refile.org"
                             "/home/kim/Dropbox/org/class/class.org"))
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
         (file+datetree "/home/kim/Dropbox/org/journal/journal.org")
         "%U\n\n%?" :empty-lines-before 1)
        ("t" "todo entry in refile " entry (file+headline "/home/kim/Dropbox/org/refile.org" "Tasks")
    "* TODO %?\n  %i\n" )
         ("n" "note" entry (file+headline "/home/kim/Dropbox/org/refile.org" "Notes")
    "* %?\n  %i\n" )
         ("c" "Class" entry
      (file "/home/kim/Dropbox/org/class/class.org")
      #'org-capture-class)
     ("e" "Exercise session" entry
      (file "/home/kim/Dropbox/org/class/class.org"))))

(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

(setq org-src-fontify-natively t)
(setq org-export-html-style-include-scripts nil
       org-export-html-style-include-default nil)
 (setq org-export-html-style
   "<link rel=\"stylesheet\" type=\"text/css\"
href=\"/home/kim/Dropbox/org/solarized-light.css\"
 />")

;; allow for export=>beamer by placing
;;(require 'ox-latex)
;; #+LaTeX_CLASS: beamer in org files
(unless (boundp 'org-export-latex-classes)
  (setq org-export-latex-classes nil))
(add-to-list 'org-export-latex-classes
  ;; beamer class, for presentations
  '("beamer"
     "\\documentclass[11pt]{beamer}\n
      \\mode<{{{beamermode}}}>\n
      \\usetheme{{{{beamertheme}}}}\n
      \\usecolortheme{{{{beamercolortheme}}}}\n
      \\beamertemplateballitem\n
      \\setbeameroption{show notes}
      \\usepackage[utf8]{inputenc}\n
      \\usepackage[T1]{fontenc}\n
      \\usepackage{hyperref}\n
      \\usepackage{color}
      \\usepackage{listings}
      \\lstset{numbers=none,language=[ISO]C++,tabsize=4,
  frame=single,
  basicstyle=\\small,
  showspaces=false,showstringspaces=false,
  showtabs=false,
  keywordstyle=\\color{blue}\\bfseries,
  commentstyle=\\color{red},
  }\n
      \\usepackage{verbatim}\n
      \\institute{{{{beamerinstitute}}}}\n          
       \\subject{{{{beamersubject}}}}\n"

     ("\\section{%s}" . "\\section*{%s}")
     
     ("\\begin{frame}[fragile]\\frametitle{%s}"
       "\\end{frame}"
       "\\begin{frame}[fragile]\\frametitle{%s}"
       "\\end{frame}")))

  ;; letter class, for formal letters

  (add-to-list 'org-export-latex-classes

  '("letter"
     "\\documentclass[11pt]{letter}\n
      \\usepackage[utf8]{inputenc}\n
      \\usepackage[T1]{fontenc}\n
      \\usepackage{color}"
     
     ("\\section{%s}" . "\\section*{%s}")
     ("\\subsection{%s}" . "\\subsection*{%s}")
     ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
     ("\\paragraph{%s}" . "\\paragraph*{%s}")
     ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))


(add-to-list 'org-export-latex-classes
 '("article"
               "\\documentclass{article}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;; active Babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((gnuplot . t)
 (js . t)
 (calc . t)
 (C . t)
 (sh . t)
 (python . t)
 (java . t)
 (latex . t)
 (prolog . t)
;;(erlang . t)
 (ditaa . t)))
;; add additional languages with '((language . t)))

(add-hook 'org-mode-hook
          (lambda ()
(local-set-key (kbd "C-1") (lambda()
                               (interactive)
                               (show-all)
                               (artist-mode)))
     ))

;;Configure Outbound Mail
;;Tell the program who you are
(setq user-full-name "Kim Hammar")
(setq user-mail-address "hammar.kim@gmail.com")

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
 vm-mail-header-from "Kim Hammar <hammar.kim@gmail.com>"
 )
(setq compose-mail-check-user-agent nil)

;; the exact path may differ -- check it
(add-to-list 'load-path "~/.emacs.d/mu4e")
(require 'mu4e)

;; default
;; (setq mu4e-maildir "~/Maildir")
(setq mu4e-drafts-folder "/[Gmail].Utkast")
(setq mu4e-sent-folder   "/[Gmail].Skickat")
(setq mu4e-trash-folder  "/[Gmail].Papperskorgen")
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
       ("/[Gmail].Skickat"   . ?s)
       ("/[Gmail].Papperskorgen"       . ?t)
       ("/[Gmail].Alla mail"    . ?a)))

;; don't save message to Sent Messages, Gmail/IMAP takes care of this
(setq mu4e-sent-messages-behavior 'delete)

;; allow for updating mail using 'U' in the main view:
(setq mu4e-get-mail-command "offlineimap")
;; something about ourselves
(setq
   user-mail-address "hammar.kim@gmail.com"
   user-full-name  "Kim Hammar"
)

 (setq mu4e-compose-signature (with-temp-buffer
                                     (insert-file-contents "~/.signature")
                                     (buffer-string)))

      (setq message-signature-file "~/.signature")

;; sending mail -- replace USERNAME with your gmail username
;; also, make sure the gnutls command line utils are installed
;; package 'gnutls-bin' in Debian/Ubuntu
(require 'smtpmail)
(setq message-send-mail-function 'smtpmail-send-it
   starttls-use-gnutls t
   smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
   smtpmail-auth-credentials
     '(("smtp.gmail.com" 587 "hammar.kim@gmail.com" nil))
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
 
    ;; show images
    (setq mu4e-show-images t)
 
    ;; use imagemagick, if available
    (when (fboundp 'imagemagick-register-types)
      (imagemagick-register-types))
 
    ;;; message view action
    (defun mu4e-msgv-action-view-in-browser (msg)
      "View the body of the message in a web browser."
      (interactive)
      (let ((html (mu4e-msg-field (mu4e-message-at-point t) :body-html))
            (tmpfile (format "%s/%d.html" temporary-file-directory (random))))
        (unless html (error "No html part for this message"))
        (with-temp-file tmpfile
          (insert
           "<html>"
           "<head><meta http-equiv=\"content-type\""
           "content=\"text/html;charset=UTF-8\">"
           html))
        (browse-url (concat "file://" tmpfile))))
 
    (add-to-list 'mu4e-view-actions
                 '("View in browser" . mu4e-msgv-action-view-in-browser) t)
 
    ;; convert org mode to HTML automatically
    (setq org-mu4e-convert-to-html t)
 
    ;; need this to convert some e-mails properly
    (setq mu4e-html2text-command "html2text -utf8 -width 72")
  
  (mu4e)

 
(defalias 'org-mail 'org-mu4e-compose-org-mode)

;;; integrate ido with artist-mode
   (defun artist-ido-select-operation (type)
     "Use ido to select a drawing operation in artist-mode"
     (interactive (list (ido-completing-read "Drawing operation: " 
                                             (list "Pen" "Pen Line" "line" "straight line" "rectangle" 
                                                   "square" "poly-line" "straight poly-line" "ellipse" 
                                                   "circle" "text see-thru" "text-overwrite" "spray-can" 
                                                   "erase char" "erase rectangle" "vaporize line" "vaporize lines" 
                                                   "cut rectangle" "cut square" "copy rectangle" "copy square" 
                                                   "paste" "flood-fill"))))
     (artist-select-operation type))


(defun artist-ido-select-settings (type)
     "Use ido to select a setting to change in artist-mode"
     (interactive (list (ido-completing-read "Setting: " 
                                             (list "Set Fill" "Set Line" "Set Erase" "Spray-size" "Spray-chars" 
                                                   "Rubber-banding" "Trimming" "Borders"))))
     (if (equal type "Spray-size") 
       (artist-select-operation "spray set size")
       (call-interactively (artist-fc-get-fn-from-symbol 
                            (cdr (assoc type '(("Set Fill" . set-fill)
                                               ("Set Line" . set-line)
                                               ("Set Erase" . set-erase)
                                               ("Rubber-banding" . rubber-band)
                                               ("Trimming" . trimming)
                                               ("Borders" . borders)
                                               ("Spray-chars" . spray-chars))))))))

(add-hook 'artist-mode-init-hook 
             (lambda ()
               (define-key artist-mode-map (kbd "C-c C-a C-o") 'artist-ido-select-operation)
               (define-key artist-mode-map (kbd "C-c C-a C-c") 'artist-ido-select-settings)))


(add-hook 'artist-mode-hook
          (lambda ()
        (local-set-key (kbd "C-1") (lambda()
                                                (interactive)
                                    (org-mode)
                                                (show-all)))
            (local-set-key (kbd "C-2") 'artist-select-op-erase-char) ; f2 = pen mode
        (local-set-key (kbd "C-3") 'artist-select-op-line)     ; f3 = line
            (local-set-key (kbd "C-4") 'artist-select-op-square)   ; f4 = rectangle
            (local-set-key (kbd "C-5") 'artist-select-op-text-see-thru)  ; f5 = ellipse
     ))

;;ditaa path
(setq org-ditaa-jar-path "/usr/bin/ditaa")

;; disable the gui.  Who uses emacs for toolbars and menus?
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(setq menu-prompting nil)

(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Always ask for y/n keypress instead of typing out 'yes' or 'no'
(defalias 'yes-or-no-p 'y-or-n-p)

(setq default-frame-alist (append (list 
  '(width  . 81)  ; Width set to 81 characters 
  '(height . 40)) ; Height set to 60 lines 
  default-frame-alist)) 

(setq inhibit-startup-message   t)   ; Don't want any startup message 
(setq make-backup-files         nil) ; Don't want any backup files 
(setq auto-save-list-file-name  nil) ; Don't want any .saves files 
(setq auto-save-default         nil) ; Don't want any auto saving 

(setq search-highlight           t) ; Highlight search object 
(setq query-replace-highlight    t) ; Highlight query object 

; number of characters until the fill column
(setq fill-column 70)

; specify the fringe width for windows -- this sets both the left and
; right fringes to 10
(require 'fringe)
(fringe-mode 10)

; lines which are exactly as wide as the window (not counting the
; final newline character) are not continued. Instead, when point is
; at the end of the line, the cursor appears in the right fringe.
(setq overflow-newline-into-fringe t)

; each line of text gets one line on the screen (i.e., text will run
; off the left instead of wrapping around onto a new line)
(setq truncate-lines t)
; truncate lines even in partial-width windows
(setq truncate-partial-width-windows t)

; display line numbers to the right of the window
(global-linum-mode t)
; show the current line and column numbers in the stats bar as well
(line-number-mode t)
(column-number-mode t)

; highlight the current line
(require 'highlight-current-line)
(global-hl-line-mode t)
(setq highlight-current-line-globally t)
(setq highlight-current-line-high-faces nil)
(setq highlight-current-line-whole-line nil)
(setq hl-line-face (quote highlight))

; make sure transient mark mode is enabled (it should be by default,
; but just in case)
(transient-mark-mode t)

; turn on mouse wheel support for scrolling
(require 'mwheel)
(mouse-wheel-mode t)

;-------------------------;
;;; Syntax Highlighting ;;;
;-------------------------;

; text decoration
(require 'font-lock)
(setq font-lock-maximum-decoration t)
(global-font-lock-mode t)
(global-hi-lock-mode nil)
(setq jit-lock-contextually t)
(setq jit-lock-stealth-verbose t)

; if there is size information associated with text, change the text
; size to reflect it
(size-indication-mode t)

(setq dired-listing-switches "-Al --si --time-style long-iso")

(global-set-key (kbd "M-d") 'backward-kill-word)
(global-set-key (kbd "C-d") 'delete-backward-char)
(global-set-key (kbd "C-z") 'undo) 
(global-set-key (kbd "C-x C-h") (lambda() (interactive)(find-file "/home/kim/")))
(global-set-key (kbd "C-x C-r") (lambda() (interactive)(find-file "/")))
(global-set-key (kbd "<f10>") (lambda() (interactive)(find-file "/home/kim/Dropbox/org/")))
(global-set-key [S-dead-grave] "`")
(global-set-key [S-dead-acute] "`")
(global-set-key (kbd "<S-dead-circumflex>") "^")
(global-set-key (kbd "<dead-tilde>") "~")
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-c ?") 'toggle-maximize-buffer) 
(global-set-key (kbd "<f2>") 'ansi-term)
(global-set-key (kbd "<f4>") 'mu4e)
(global-set-key (kbd "C-x C-b") 'ibuffer-other-window)
(global-set-key (kbd "C-c n") 'rename-file-and-buffer)
(global-set-key (kbd "C-c m") 'move-buffer-file)
(global-set-key (kbd "C-c q") 'revert-all-buffers)
(global-set-key (kbd "C-c ESC") 'close-all-buffer)
(global-set-key (kbd "C-c d") 'delete-file-and-buffer)
(global-set-key (kbd "C-c c") 'copy-current-file-path)
(global-set-key (kbd "<f12>") 'org-agenda)
(global-set-key (kbd "<f11>") 'org-agenda-list)
(global-set-key [f8] 'toggle-fullscreen)
(global-set-key (kbd "C-!") 'babcore-shell-execute)
(global-set-key (kbd "<backtab>") 'tabbar-backward)
(global-set-key [C-tab] 'tabbar-forward)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-?") 'text-scale-increase)
(global-set-key (kbd "C-_") 'text-scale-decrease)
(global-set-key (kbd "M-e") 'apply-macro-to-region-lines)
(define-key global-map "\C-cp" 'org-capture)
(define-key global-map (kbd "M-s") 'ace-jump-mode)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-x G") 'magit-status)
(global-set-key (kbd "C-S-i") 'eclim-java-import-organize)
(global-set-key (kbd "C-c l") 'eclim-problems)
(global-set-key (kbd "C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "C-+") 'enlarge-window)
(global-set-key (kbd "C--") 'shrink-window)
(global-set-key (kbd "§") 'hippie-expand)
(global-set-key (kbd "<f5>") 'goto-line)
(global-set-key (kbd "M-i") 'ido-goto-symbol)
(global-set-key  (kbd "C-M-g") 'org-plot/gnuplot)
(global-set-key  (kbd "C-§") 'auto-complete-mode)
(global-set-key  (kbd "RET") 'newline-and-indent)
(global-set-key  (kbd "C-<return>") 'mark-page)
(defun shell-mode-hook () (interactive)
      (local-set-key (kbd "C-c l") 'erase-buffer))
(global-set-key (kbd "C-1") (lambda()
                               (interactive)
                               (show-all)
                               (artist-mode)))
