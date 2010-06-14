(add-to-list 'load-path "~/.emacs.d")

;; disable bell function
(setq ring-bell-function 'ignore)

;; disable toolbar
(tool-bar-mode -1)

;; disable scrollbar
(toggle-scroll-bar -1)

;; disable splash screen
(custom-set-variables '(inhibit-startup-screen t))

;; current buffer name in title bar
(setq frame-title-format "%b")

;; No backups
(setq make-backup-files nil)

;;;; VIM COMPAT

(add-to-list 'load-path "~/Code/vimpulse")
(require 'vimpulse)

(add-to-list 'load-path "~/Code/redo")
(require 'redo)

;;;; NXHTML (includes viper-tut.el)
;;(load "~/Code/nxhtml/util/ourcomments-util.el")
;;(load "~/Code/nxhtml/util/mumamo.el")
;;(load "~/Code/nxhtml/util/viper-tut.el")

;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
  (load
   (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

;; require or autoload paredit-mode
(defun lisp-enable-paredit-hook () (paredit-mode 1))
(add-hook 'clojure-mode-hook 'lisp-enable-paredit-hook)

(eval-after-load 'paredit
  '(progn
    (viper-add-local-keys 'vi-state '(("\C-\M-h" . paredit-backward-slurp-sexp)))
    (viper-add-local-keys 'vi-state '(("\C-\M-l" . paredit-forward-slurp-sexp)))
    (viper-add-local-keys 'vi-state '(("\M-n" . paredit-splice-sexp)))
    (viper-add-local-keys 'vi-state '(("\M-]" . paredit-bracket-wrap-sexp)))
    (viper-add-local-keys 'vi-state '(("\M-}" . paredit-brace-wrap-sexp)))
    ))

(setq viper-translate-all-ESC-keysequences nil)
(setq viper-ESC-keyseq-timeout 20)
(setq viper-no-multiple-ESC 't)
(setq vc-handled-backends nil)

;; No TABs!
(setq indent-tabs-mode nil)
(setq-default indent-tabs-mode nil)
