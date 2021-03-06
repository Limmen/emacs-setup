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

;; Only spaces, no tabs
(setq indent-tabs-mode nil)
(electric-indent-mode 1)

(add-hook 'ein:notebook-mode-hook
	  (lambda ()
	    (setq indent-tabs-mode nil)))

(add-hook 'python-mode-hook
  (lambda () (setq python-indent-offset 4)))

(setq tab-width 4)

(use-package ein
  :pin melpa
  :ensure t
  :config
  (setq indent-tabs-mode nil)
  (setq ein:use-auto-complete t))

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
  (setq ispell-dictionary "american")
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

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))
