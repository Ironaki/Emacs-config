;; Swap Delete and C-h
;; C-h delete the character before the cursor
(define-key key-translation-map (kbd "C-h") (kbd "<deletechar>"))
(define-key key-translation-map (kbd "<deletechar>") (kbd "C-h"))
(global-set-key (kbd "<deletechar>") 'delete-backward-char)
(define-key key-translation-map (kbd "C-x C-j") 'meta)
 
;; C-h always kill the current buffer
(defun iro/kill-this-buffer ()
  "Kill the current buffer."
  (interactive)
  (kill-buffer (current-buffer)))

(global-set-key (kbd "C-x k") 'iro/kill-this-buffer)


(provide 'init-keybinding)
