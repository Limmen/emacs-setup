;Initialize package-archives
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)

;;Set themes
;(load-theme 'ample t t)
(load-theme 'ample-flat t t)
;(load-theme 'ample-light t t)
;(enable-theme 'ample)
 (enable-theme 'ample-flat)
;(enable-theme 'ample-light)



;ace-jump
(require 'ace-jump-mode)
;yasnippet
(require 'yasnippet)
(yas-global-mode 1)
;ido
(require 'ido-vertical-mode)
(ido-mode t)
(setq ido-enable-flex-matching t)
(ido-vertical-mode t)
(require 'smex)
(require 'dired+)
(require 'autopair)

;Default global modes
(show-paren-mode 1)
(global-linum-mode 1)
(nyan-mode 1)
(global-visual-line-mode t)
(autopair-global-mode) 
(setq-default indent-tabs-mode nil) 
(setq-default tab-width 4) 
; display line numbers to the right of the window
(global-linum-mode t)
; show the current line and column numbers in the stats bar as well
(line-number-mode t)
(column-number-mode t)
; make sure transient mark mode is enabled (it should be by default,
; but just in case)
(transient-mark-mode t)

;;ditaa path
(setq org-ditaa-jar-path "/usr/bin/ditaa")

;; disable the gui.  
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(psetq menu-prompting nil)

;;Set encodings
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

; turn on mouse wheel support for scrolling
(require 'mwheel)
(mouse-wheel-mode t)


;;Keybinds
(global-set-key (kbd "M-d") 'backward-kill-word)
(global-set-key (kbd "C-d") 'delete-backward-char)
(global-set-key (kbd "C-z") 'undo) 
(global-set-key [S-dead-grave] "`")
(global-set-key [S-dead-acute] "`")
(global-set-key (kbd "<S-dead-circumflex>") "^")
(global-set-key (kbd "<dead-tilde>") "~")
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(define-key global-map (kbd "M-s") 'ace-jump-mode)
(global-set-key (kbd "C-x G") 'magit-status)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-?") 'text-scale-increase)
(global-set-key (kbd "C-_") 'text-scale-decrease)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-x G") 'magit-status)
(global-set-key (kbd "C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "C-+") 'enlarge-window)
(global-set-key (kbd "C--") 'shrink-window)
(global-set-key (kbd "<f5>") 'goto-line)
(global-set-key  (kbd "C-<return>") 'mark-page)
(global-set-key  (kbd "C-M-¤") 'dired-do-query-replace-regexp)
(global-set-key  (kbd "C-§") 'yas-expand)
(global-set-key (kbd "C-1") (lambda()
			       (interactive)
			       (show-all)
			       (artist-mode)))

;;org-mode settings
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

(setq org-src-fontify-natively t)
(setq org-export-html-style-include-scripts nil
       org-export-html-style-include-default nil)
 (setq org-export-html-style
   "<link rel=\"stylesheet\" type=\"text/css\"
href=\"/home/kim/Dropbox/org/solarized-light.css\"
 />")

;;erlang mode
(setq load-path (cons  "/usr/local/otp/lib/tools-<ToolsVer>/emacs"
   load-path))
   (setq erlang-root-dir "/usr/local/otp")
   (setq exec-path (cons "/usr/local/otp/bin" exec-path))
   (require 'erlang-start)
