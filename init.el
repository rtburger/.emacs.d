;; ===============================================
;; Basic Editor Settings
;; ===============================================

;; Do not show the startup screen
(setq inhibit-startup-message t)

;; Enable line numbers globally
(global-display-line-numbers-mode t)

;; Scroll one line at a time
(setq scroll-conservatively 100)

;; Highlight the current line (only in GUI mode)
(when window-system (global-hl-line-mode t))

;; Silence the bell function
(setq ring-bell-function 'ignore)

;; Keybindings
(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "C-c SPC") 'set-mark-command)

;; Force bash as the default shell for ansi-term
(defvar my-term-shell "/bin/bash")
(defadvice ansi-term (before force-bash)
  (interactive (list my-term-shell)))
(ad-activate 'ansi-term)

;; Store backups and auto-saves in specific directories
(setq backup-directory-alist `(("." . "~/.emacs.d/backups"))
      auto-save-file-name-transforms `((".*" "~/.emacs.d/auto-saves/" t)))

;; ===============================================
;; Custom File Settings
;; ===============================================

;; Set custom-file to avoid polluting the init file
(setq custom-file "~/.emacs.d/custom-file.el")

;; Load the custom-file
(load-file custom-file)

;; ===============================================
;; Package Management
;; ===============================================

;; Initialize the package system
(require 'package)
(package-initialize)

;; Add MELPA to the list of package archives
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; Ensure `use-package` is installed, if not, install it
(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

;; ===============================================
;; Package Configurations
;; ===============================================

;; Spacemacs Theme
(use-package spacemacs-theme
  :ensure t
  :config
  (setq spacemacs-theme-comment-italic t)
  (load-theme 'spacemacs-dark))

;; Which-key for better keybinding prompts
(use-package which-key
  :ensure t
  :config
  (which-key-mode t))

;; Company for autocompletion
(use-package company
  :ensure t
  :bind (:map company-active-map
              ("C-n" . company-select-next)
              ("C-p" . company-select-previous))
  :config
  (setq company-idle-delay 0.3)
  :init
  (add-hook 'after-init-hook 'global-company-mode))

;; Magit for Git integration
(use-package magit
  :ensure t)

;; Paredit for structural editing
(use-package paredit
  :disabled t
  :ensure t
  :hook ((clojure-mode . enable-paredit-mode)
         (cider-repl-mode . enable-paredit-mode)
         (emacs-lisp-mode . enable-paredit-mode)
         (eval-expression-minibuffer-setup . enable-paredit-mode)
         (lisp-mode . enable-paredit-mode)
         (lisp-interaction-mode . enable-paredit-mode))
  :config
  (show-paren-mode t)
  :bind (("M-[" . paredit-wrap-square)
         ("M-{" . paredit-wrap-curly)))

;; Rainbow delimiters for colorful parentheses
(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

;; Clojure configurations
(use-package clojure-mode
  :ensure t
  :hook (clojure-mode . subword-mode))
  
; Cider configurations
(use-package cider
  :ensure t
  :hook ((cider-mode . eldoc-mode)
         (cider-repl-mode . company-mode) ; Autocompletion in REPL
         (cider-mode . company-mode))     ; Autocompletion in Clojure buffers
  :config
  (setq cider-repl-pop-to-buffer-on-connect 'display-only)
  :bind
  (("C-c C-z" . cider-switch-to-repl-buffer))) ; Keybinding to quickly switch to REPL buffer

