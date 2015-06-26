
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)

(require 'flycheck)
(require 'erlang-start)
(require 'auto-complete)
(require 'auto-complete-config)
(require 'yasnippet)
(require 'autopair)
(require 'web-mode)
(require 'ibuffer)
(require 'org)
(require 'tabbar)
(require 'ecb-autoloads)
(require 'ace-jump-mode)
(require 'ido-vertical-mode)
(require 'smex)
(require 'ido-hacks nil t)
(require 'eclim)
(require 'eclimd)
(require 'ac-emacs-eclim-source)
(require 'company)
(require 'company-emacs-eclim)
(require 'fill-column-indicator)
(require 'python-mode)
(require 'gnuplot-mode)
(require 'dired+)



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

;; (require 'helm-config)
;; (helm-mode 1)
;; (setq helm-idle-delay 0.01)
;; (setq helm-input-idle-delay 0.01)
;; (global-set-key (kbd "M-x") 'helm-M-x)
;; (global-set-key (kbd "C-x b") 'helm-mini)
;; (global-set-key (kbd "C-x C-f") 'helm-find-files)
;; (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
;;
;;(require 'helm-files)
;;(setq helm-idle-delay 0.1)
;;(setq helm-input-idle-delay 0.1)
;;(setq helm-locate-command "locate %s -e -A %s")
;;(global-set-key (kbd "C-x C-f") 'helm-for-files)

(setq ecb-layout-name "left2")

; turn on the tabbar
(tabbar-mode t)
; define all tabs to be one of 3 possible groups: “Emacs Buffer”, “Dired”,
;“User Buffer”.
(defun tabbar-buffer-groups ()
  "Return the list of group names the current buffer belongs to.
This function is a custom function for tabbar-mode's tabbar-buffer-groups.
This function group all buffers into 3 groups:
Those Dired, those user buffer, and those emacs buffer.
Emacs buffer are those starting with “*”."
  (list
   (cond
    ((string-equal "*" (substring (buffer-name) 0 1))
     "Emacs Buffer"
     )
    ((eq major-mode 'dired-mode)
     "Dired"
     )
    (t
     "User Buffer"
     )
    ))) 

(setq tabbar-buffer-groups-function 'tabbar-buffer-groups)

(setq tabbar-background-color "#959A79") ;; the color of the tabbar background
(custom-set-faces
 '(tabbar-default ((t (:inherit variable-pitch :background "#959A79" :foreground "black" :weight bold))))
 '(tabbar-button ((t (:inherit tabbar-default :foreground "dark red"))))
 '(tabbar-button-highlight ((t (:inherit tabbar-default))))
 '(tabbar-highlight ((t (:underline t))))
 '(tabbar-selected ((t (:inherit tabbar-default :background "#95CA59"))))
 '(tabbar-separator ((t (:inherit tabbar-default :background "#95CA59"))))
 '(tabbar-unselected ((t (:inherit tabbar-default)))))

(smex-initialize)

(setq hippie-expand-try-functions-list '(try-expand-dabbrev try-expand-dabbrev-all-buffers try-expand-dabbrev-from-kill try-complete-file-name-partially try-complete-file-name try-expand-all-abbrevs try-expand-list try-expand-line try-complete-lisp-symbol-partially try-complete-lisp-symbol))

;;(ac-config-default)
;;(setq ac-use-menu-map t)

(ac-emacs-eclim-config)
(setq eclim-auto-save t)
(global-eclim-mode)

(company-emacs-eclim-setup)
(global-company-mode t)

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

(show-paren-mode 1)
(global-linum-mode 1)
(nyan-mode 1)
;;(auto-complete-mode 1)
(global-visual-line-mode t)
(ido-mode 1)
(ido-vertical-mode 1)
(autopair-global-mode) ;; enable autopair in all buffers
(yas-global-mode 1)
;;(global-auto-complete-mode t)
(global-eclim-mode)

;;(setq-default indent-tabs-mode t)

;; make indentation commands use space only (never tab character)
(setq-default indent-tabs-mode nil) ; emacs 23.1, 24.2, default to t
(setq-default tab-width 4) ; Assuming you want your tabs to be four spaces wide

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
(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . js-mode))

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

;;'(custom-enabled-themes (quote (solarized-dark)))

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
(defun close-all-buffer ()
  "Closes all the buffers."
  (interactive)
  (mapc (lambda (buffer) (kill-buffer buffer)) (buffer-list)))
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
;;Create necessary dirs automaticly
(defadvice find-file (before make-directory-maybe (filename &optional wildcards) activate)
  "Create parent directory if not exists while visiting file."
  (unless (file-exists-p filename)
    (let ((dir (file-name-directory filename)))
      (unless (file-exists-p dir)
        (make-directory dir)))))


(defun copy-current-file-path ()
  "Add current file path to kill ring. Limits the filename to project root if possible."
  (interactive)
  (let ((filename (buffer-file-name)))
    (kill-new (if eproject-mode
                  (s-chop-prefix (eproject-root) filename)
                filename))))

; fullscreen, taken from http://www.emacswiki.org/emacs/FullScreen#toc26
; should work for X und OSX with emacs 23.x (TODO find minimum version).
; for windows it uses (w32-send-sys-command #xf030) (#xf030 == 61488)
(defvar babcore-fullscreen-p t "Check if fullscreen is on or off")
(setq babcore-stored-frame-width nil)
(setq babcore-stored-frame-height nil)
(defun babcore-non-fullscreen ()
  (interactive)
  (if (fboundp 'w32-send-sys-command)
      ;; WM_SYSCOMMAND restore #xf120
      (w32-send-sys-command 61728)
    (progn (set-frame-parameter nil 'width 
                                (if babcore-stored-frame-width
                                    babcore-stored-frame-width 82))
           (set-frame-parameter nil 'height
                                (if babcore-stored-frame-height 
                                    babcore-stored-frame-height 42))
           (set-frame-parameter nil 'fullscreen nil))))
(defun babcore-fullscreen ()
  (interactive)
  (setq babcore-stored-frame-width (frame-width))
  (setq babcore-stored-frame-height (frame-height))
  (if (fboundp 'w32-send-sys-command)
      ;; WM_SYSCOMMAND maximaze #xf030
      (w32-send-sys-command 61488)
    (set-frame-parameter nil 'fullscreen 'fullboth)))
(defun toggle-fullscreen ()
  (interactive)
  (setq babcore-fullscreen-p (not babcore-fullscreen-p))
  (if babcore-fullscreen-p
      (babcore-non-fullscreen)
    (babcore-fullscreen)))

; colored shell commands via C-!
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(defun babcore-shell-execute(cmd)
  "Execute a shell command in an interactive shell buffer."
   (interactive "sShell command: ")
   (shell (get-buffer-create "*shell-commands-buf*"))
   (process-send-string (get-buffer-process "*shell-commands-buf*") (concat cmd "\n")))

(defun ido-goto-symbol (&optional symbol-list)
      "Refresh imenu and jump to a place in the buffer using Ido."
      (interactive)
      (unless (featurep 'imenu)
        (require 'imenu nil t))
      (cond
       ((not symbol-list)
        (let ((ido-mode ido-mode)
              (ido-enable-flex-matching
               (if (boundp 'ido-enable-flex-matching)
                   ido-enable-flex-matching t))
              name-and-pos symbol-names position)
          (unless ido-mode
            (ido-mode 1)
            (setq ido-enable-flex-matching t))
          (while (progn
                   (imenu--cleanup)
                   (setq imenu--index-alist nil)
                   (ido-goto-symbol (imenu--make-index-alist))
                   (setq selected-symbol
                         (ido-completing-read "Symbol? " symbol-names))
                   (string= (car imenu--rescan-item) selected-symbol)))
          (unless (and (boundp 'mark-active) mark-active)
            (push-mark nil t nil))
          (setq position (cdr (assoc selected-symbol name-and-pos)))
          (cond
           ((overlayp position)
            (goto-char (overlay-start position)))
           (t
            (goto-char position)))))
       ((listp symbol-list)
        (dolist (symbol symbol-list)
          (let (name position)
            (cond
             ((and (listp symbol) (imenu--subalist-p symbol))
              (ido-goto-symbol symbol))
             ((listp symbol)
              (setq name (car symbol))
              (setq position (cdr symbol)))
             ((stringp symbol)
              (setq name symbol)
              (setq position
                    (get-text-property 1 'org-imenu-marker symbol))))
            (unless (or (null position) (null name)
                        (string= (car imenu--rescan-item) name))
              (add-to-list 'symbol-names name)
              (add-to-list 'name-and-pos (cons name position))))))))

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

(defadvice term-sentinel (around my-advice-term-sentinel (proc msg))
  (if (memq (process-status proc) '(signal exit))
      (let ((buffer (process-buffer proc)))
        ad-do-it
        (kill-buffer buffer))
    ad-do-it))
(ad-activate 'term-sentinel)

(defvar my-term-shell "/bin/bash")
(defadvice ansi-term (before force-bash)
  (interactive (list my-term-shell)))
(ad-activate 'ansi-term)

(defun my-term-use-utf8 ()
  (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))
(add-hook 'term-exec-hook 'my-term-use-utf8)

(add-hook 'term-mode-hook (lambda ()
                            (define-key term-raw-map (kbd "C-y") 'term-paste)))

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-to-list 'comint-output-filter-functions 'ansi-color-process-output)

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
;;(erlang . t)
 (ditaa . t)))
;; add additional languages with '((language . t)))

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

(global-set-key (kbd "M-d") 'backward-kill-word)
(global-set-key (kbd "C-d") 'delete-backward-char)
(global-set-key (kbd "C-z") 'undo) 
(global-set-key (kbd "C-x C-h") (lambda() (interactive)(find-file "/home/kim/")))
(global-set-key (kbd "C-x C-r") (lambda() (interactive)(find-file "/")))
(global-set-key (kbd "<f10>") (lambda() (interactive)(find-file "/home/kim/Dropbox/org/")))
(global-set-key [S-dead-grave] "`")
(global-set-key [S-dead-acute] "`")
(global-set-key (kbd "<S-dead-circumflex>") "^")
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
(global-set-key  (kbd "C-§") auto-complete-mode)
(defun shell-mode-hook () (interactive)
      (local-set-key (kbd "C-c l") 'erase-buffer))
