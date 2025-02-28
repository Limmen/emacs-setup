(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)

;; Refresh package contents if needed
(unless package-archive-contents
  (package-refresh-contents))

;; Install sourcerer-theme if not already installed
(unless (package-installed-p 'sourcerer-theme)
  (package-install 'sourcerer-theme))

;; Load the theme
(load-theme 'sourcerer t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(multiple-cursors auctex smex ivy sourcerer-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Install ivy if not already installed
(unless (package-installed-p 'ivy)
  (package-install 'ivy))

;; Enable ivy mode
(ivy-mode 1)

;; Optional: Configure Ivy settings for better UX
(setq ivy-use-virtual-buffers t
      ivy-count-format "(%d/%d) "
      enable-recursive-minibuffers t)

;; Ensure smex is installed and initialized
(unless (package-installed-p 'smex)
  (package-refresh-contents)
  (package-install 'smex))

(require 'smex)
(smex-initialize)

(use-package multiple-cursors
  :ensure t  ;; This ensures the package is installed if missing
  :bind
  (("C-S-c C-S-c" . mc/edit-lines)
   ("C->" . mc/mark-next-like-this)
   ("C-<" . mc/mark-previous-like-this)
   ("C-c C->" . mc/mark-all-like-this)))

;; Map Command key to Meta
(setq mac-command-modifier 'meta)

;; Optional: Disable Option as Meta if you don't want conflicts
(setq mac-option-modifier 'none)

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


;; Disable the toolbar
(tool-bar-mode -1)

;; Disable the menu bar
(menu-bar-mode -1)

;; Disable the scroll bar
(scroll-bar-mode -1)

;; Optional: Disable startup screen
(setq inhibit-startup-screen t)

;(global-set-key (kbd "s-:") 'end-of-buffer)
;(global-set-key (kbd "s-<") 'beginning-of-buffer)
;;(global-set-key (kbd "s-w") 'kill-ring-save)


;;;latex config
(use-package tex
  :defer t
  :ensure auctex
  :config
  (setq TeX-auto-save t)
  (add-hook 'LaTeX-mode-hook 'flyspell-mode)
  (setq ispell-dictionary "american")
  (add-hook 'LaTeX-mode-hook 'ispell))

(setq TeX-view-program-selection '((output-pdf "Skim")))
(setq TeX-source-correlate-mode t)
(setq TeX-source-correlate-start-server t)
(add-hook 'TeX-after-compilation-finished-functions
          #'TeX-revert-document-buffer)

