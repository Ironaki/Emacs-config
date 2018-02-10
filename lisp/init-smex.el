;; Use smex to handle M-x
;; Change path for ~/.smex-items
(setq-default smex-save-file (expand-file-name ".smex-items" user-emacs-directory))
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-x M-x") 'execute-extended-command)
;(global-set-key (kbd "M-X") 'smex-major-mode-commands)

(provide 'init-smex)
