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

;; erlang
(setq load-path (cons  "/usr/lib/erlang/lib/tools-2.10/emacs"
		       load-path))
(setq erlang-root-dir "/usr/lib/erlang")
(setq exec-path (cons "/usr/lib/erlang/lib" exec-path))
(require 'erlang-start)
(require 'erlang-flymake)

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
        )

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
(require 'prolog)
(autoload 'run-prolog "prolog" "Start a Prolog sub-process." t)
(autoload 'prolog-mode "prolog" "Major mode for editing Prolog programs." t)
(autoload 'mercury-mode "prolog" "Major mode for editing Mercury programs." t)
(setq prolog-system 'swi)
(setq auto-mode-alist (append '(("\\.pl$" . prolog-mode)
                                ("\\.m$" . mercury-mode))
                              auto-mode-alist))

;;diary
;;(setq diary-file "~/Dropbox/org/diary_file")
(setq
 diary-display-function 'diary-fancy-display
 diary-file "~/Dropbox/org/diary_file"
 diary-comment-start "/*"
 diary-comment-end "*/"
 calendar-mark-diary-entries-flag t
 calendar-mark-holidays-flag t)

(add-hook 'calendar-today-visible-hook 'calendar-mark-today)
(add-hook 'diary-list-entries-hook 'diary-include-other-diary-files)
(add-hook 'diary-mark-entries-hook 'diary-mark-included-diary-files)
(add-hook 'diary-list-entries-hook 'diary-sort-entries t)

;;agenda
(setq org-agenda-files (list "~/Dropbox/org/agenda/work.org"
                             "~/Dropbox/org/agenda/school.org"
                             "~/Dropbox/org/agenda/home.org"))


;;bookmarks
(setq bookmark-default-file "~/Dropbox/org/bookmarks")

;; dashboard
(setq dashboard-items '((recents  . 5)
                        (bookmarks . 5)
                        (projects . 5)
                        (agenda . 5)))

(setq org-deadline-warning-days 14)

;;;latex config
(use-package tex
  :defer t
  :ensure auctex
  :config
  (setq TeX-auto-save t)
  (add-hook 'LaTeX-mode-hook 'flyspell-mode)
  (setq ispell-dictionary "british")
  (add-hook 'LaTeX-mode-hook 'ispell))

(fringe-mode 10)
					; lines which are exactly as wide as the window (not counting the
					; final newline character) are not continued. Instead, when point is
					; at the end of the line, the cursor appears in the right fringe.
(setq overflow-newline-into-fringe t)

;;emacs-lisp editing
(use-package paredit
  :ensure t
  :config
  (add-hook 'emacs-lisp-mode-hook #'paredit-mode)
  ;; enable in the *scratch* buffer
  (add-hook 'lisp-interaction-mode-hook #'paredit-mode)
  (add-hook 'ielm-mode-hook #'paredit-mode)
  (add-hook 'lisp-mode-hook #'paredit-mode)
  (add-hook 'eval-expression-minibuffer-setup-hook #'paredit-mode))

(use-package paren
  :config
  (show-paren-mode +1))

;; fetch KTH schedule
(require 'fetch-schedule)
(setq diary-remote-calendar "https://www.kth.se/social/user/192266/icalendar/1e3697b6ecf223657d5941f56a0ad2090c2bff07")
(setq diary-remote-calendar-local-replica "~/Dropbox/org/kth_diary")

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(use-package elpy
  :ensure t
  :init (elpy-enable))

;; Elpy environment with local packages
(let* (

  (my-exec-path (list
    "/home/limmen/programs/snorkel"
    "/home/limmen/programs/snorkel/treedlib"
    ))

  (my-python-path (list
    "/home/limmen/programs/snorkel"
    "/home/limmen/programs/snorkel/treedlib"
  ))
  )

  (setenv "PATH" (concat
    (mapconcat 'identity my-exec-path path-separator)
    (if (getenv "PATH") path-separator "")
    (getenv "PATH")))

  (setq exec-path (append my-exec-path exec-path))

  (setenv "PYTHONPATH" (concat
    (mapconcat 'identity my-python-path path-separator)
    (if (getenv "PYTHONPATH") path-separator "")
    (getenv "PYTHONPATH")))

)

(use-package sparql-mode
  :ensure t)

(add-to-list 'auto-mode-alist '("\\.sparql$" . sparql-mode))
(add-to-list 'auto-mode-alist '("\\.rq$" . sparql-mode))
