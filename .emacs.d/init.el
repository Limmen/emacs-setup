;;; package --- Main init file
;;; Commentary:
;;; This is my init file

;;; Code:


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path (concat user-emacs-directory "elisp"))

(require 'base)
(require 'base-theme)
(require 'base-extensions)
(require 'base-functions)
(require 'base-global-keys)
(require 'lang-web)

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
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-?") 'text-scale-increase)
(global-set-key (kbd "C-_") 'text-scale-decrease)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "C-+") 'enlarge-window)
(global-set-key (kbd "C--") 'shrink-window)
(global-set-key (kbd "<f5>") 'goto-line)
(global-set-key  (kbd "C-<return>") 'mark-page)
(global-set-key  (kbd "C-M-¤") 'dired-do-query-replace-regexp)
(global-set-key  (kbd "C-M-#") 'wdired-change-to-wdired-mode)
(global-set-key  (kbd "C-§") 'yas-expand)
(global-set-key (kbd "C-1") (lambda()
			       (interactive)
			       (show-all)
			       (artist-mode)))
(global-set-key (kbd "C-x F") 'mc/edit-lines)
(global-set-key (kbd "<up>") 'comint-previous-input) ; previous history
(global-set-key (kbd "<down>") 'comint-next-input) ; reverse history
(global-set-key [f8] 'neotree-toggle);;neotree
(global-set-key (kbd "<S-f8>") 'neotree-dir);;neotree

(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

;;scala
(use-package ensime
  :ensure t
  :pin melpa-stable)

(use-package sbt-mode
  :pin melpa)

(use-package scala-mode
  :pin melpa)

;;ditaa path
(setq org-ditaa-jar-path "/usr/bin/ditaa")

;;nyan cat!
(use-package nyan-mode
  :pin melpa
  :config
  (nyan-mode 1))

;;org-latex
(use-package ox-latex
  :config
  (unless (boundp 'org-latex-classes)
    (setq org-latex-classes nil))
  (add-to-list 'org-latex-classes
	       '("article"
		 "\\documentclass{article}"
		 ("\\section{%s}" . "\\section*{%s}")
		 ("\\subsection{%s}" . "\\subsection*{%s}")
		 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
		 ("\\paragraph{%s}" . "\\paragraph*{%s}")
		 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
  (add-hook 'LaTeX-mode-hook 'flyspell-mode) ;start flyspell-mode
  (setq ispell-dictionary "british")    ;set the default dictionary
  (add-hook 'LaTeX-mode-hook 'ispell)   ;start ispell
  )

;; erlang
(setq load-path (cons  "/usr/local/otp/lib/tools-<ToolsVer>/emacs"
			 load-path))
(setq erlang-root-dir "/usr/local/otp")
(setq exec-path (cons "/usr/local/otp/bin" exec-path))

(use-package erlang-start)
(use-package erlang-mode
  :config
  ;; Binding keys when erlang-mode is active
  (defun erlang-shell-config ()
  "For use in `erlang-shell-hook'."
  (local-set-key (kbd "<up>") 'comint-previous-input) ; previous history
  (local-set-key (kbd "<down>") 'comint-next-input) ; reverse history
  ;; more here
  )
  (add-hook 'erlang-shell-hook 'erlang-shell-config)
  (put 'erase-buffer 'disabled nil)
  ;; example of setting env var named “ERL_LIVS”, by appending a new path to existing path
  (setenv "ERL_LIBS"
        "/home/kim/Library/Erlang/lib"
        ))

(use-package erlang-flymake)

;; clear eshell
(defun eshell/clear ()
  "04Dec2001 - sailor, to clear the eshell buffer."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))

;; erc settings
(setq user-full-name "Kim Hammar")
(setq user-mail-address "kimham@kth.se")
(load "~/Dropbox/.irc")


;; prolog settings
(load-file "~/.emacs.d/prolog.el")
(autoload 'run-prolog "prolog" "Start a Prolog sub-process." t)
(autoload 'prolog-mode "prolog" "Major mode for editing Prolog programs." t)
(autoload 'mercury-mode "prolog" "Major mode for editing Mercury programs." t)
(setq prolog-system 'swi)
(setq auto-mode-alist (append '(("\\.pl$" . prolog-mode)
                                ("\\.m$" . mercury-mode))
                              auto-mode-alist))

;;diary
(setq diary-file "~/Dropbox/org/diary_file")
(add-hook 'diary-list-entries-hook 'diary-sort-entries t)

(setq org-agenda-files (list "~/Dropbox/org/agenda/work.org"
                             "~/Dropbox/org/agenda/school.org"
                             "~/Dropbox/org/agenda/home.org"))


(setq bookmark-default-file "~/Dropbox/org/bookmarks")

;; dashboard
(setq dashboard-items '((recents  . 5)
                        (bookmarks . 5)
                        (projects . 5)
                        (agenda . 5)))

(add-to-list 'org-modules "org-habit")
(setq org-deadline-warning-days 14)

;;;latex config
(use-package tex
  :defer t
  :ensure auctex
  :config
  (setq TeX-auto-save t))

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
