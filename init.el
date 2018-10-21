;; use package
(package-initialize)

;; line number
(global-linum-mode t) 

;; highlight current line; not work in terminal
;(when window-system         
;  (global-hl-line-mode t)) 

;; no startup msg  
(setq inhibit-startup-message t) 

;; no tool bar and scroll bar
(tool-bar-mode -1)
(when (display-graphic-p)
  (scroll-bar-mode -1))

;; no tab indent
(setq-default indent-tabs-mode nil)

(setq-default c-basic-offset 4)

(setq python-indent-offset 4)

;; split vertically
(setq split-width-threshold 0)
(setq split-height-threshold nil)

;; load-path
(add-to-list 'load-path "~/.emacs.d/evil/")
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; Shell mode
(setq explicit-shell-file-name "bash")
(setq explicit-bash-args '("-i" "-l"))

;; Backup and auto saving setting
(setq auto-save-file-name-transforms `((".*" , "~/.emacs.temp/" t)))
(setq backup-directory-alist
      `((".*" . , "~/.emacs.temp/")))
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)
(setq backup-by-copying-when-linked t)

;; Solarized theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/lisp/theme")
(if (display-graphic-p) (load-theme 'solarized t))

(require 'evil)
(require 'init-smex)
(when (not (display-graphic-p))
  (require 'init-term-mouse))
(require 'init-editing)
(require 'init-keybinding)
(require 'window-numbering)

;; Set C-h to backspace
;; Set C-d to help
;(global-set-key (kbd "C-h") 'delete-backward-char)


;; MELPA packages
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/")
             t)

;; elpy and python
;(setenv "IPY_TEST_SIMPLE_PROMPT" "1")
(setq python-shell-interpreter "/Users/Armstrong/anaconda/bin/python")
;      python-shell-interpreter-args "-i")
(setq elpy-rpc-python-command "/Users/Armstrong/anaconda/bin/python")
(setq python-shell-interpreter "/Users/Armstrong/anaconda/bin/ipython"
      python-shell-interpreter-args "-i --simple-prompt")
(add-hook 'python-mode-hook
  (lambda ()
    (setq python-indent 4)))

;(with-eval-after-load "csv-mode" (csv-align-fields 1 1 0))

;; Company mode set key
;(with-eval-after-load 'company
;  (define-key company-active-map (kbd "C-h") 'delete-backward-char))
;(with-eval-after-load 'company
;  (define-key company-active-map (kbd "<deletechar>") 'company-show-doc-buffer))

;; Configuration for org-mode
(org-babel-load-file "~/.emacs.d/org_config.org")

;; Set custome file path
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; Font setting
(set-frame-font "Menlo 18" nil t)
;;(set-frame-font "Source Code Pro 16" nil t)

;; Path Setting for SML, Racket, Homebrew
;; http://ergoemacs.org/emacs/emacs_env_var_paths.html
(setenv "PATH" (concat "/usr/local/smlnj/bin:"
                       "/Applications/Racket v6.10/bin:"
                        "/usr/local/bin:"
                       (getenv "PATH")))
(setq exec-path (append '("/usr/local/smlnj/bin"
                          "/Applications/Racket v6.10/bin"
                           "/usr/local/bin")
                          exec-path))
;;

;; Markdown Mode
;; Attention, this package is manually added, so you have to update it manually if you want
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(autoload 'gfm-mode "markdown-mode"
   "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))
