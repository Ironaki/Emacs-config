(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(setq use-package-verbose t)
(setq use-package-always-ensure t)

(require 'use-package)

(use-package auto-compile
  :config (auto-compile-on-load-mode))
(setq load-prefer-newer t)

(use-package org-bullets
  :init
  (add-hook 'org-mode-hook #'org-bullets-mode))

(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

(add-hook 'org-mode-hook 'flyspell-mode)

(add-hook 'org-mode-hook 'org-indent-mode)

(setq org-ellipsis " ~~>")

(setq org-src-fontify-natively t)

(setq org-src-tab-acts-natively t)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (ruby . t)
   (python . t)
   (R . t)
   (shell . t)))
