(require 'mouse) ; mouse support
(xterm-mouse-mode t) ; Turn on mouse mode
(defun track-mouse (e)) ; Track the mouse
(setq mouse-sel-mode t) ; Mouse selection
(delete-selection-mode 1) ; For deleting the current selection
(global-set-key [mouse-4] (lambda () (interactive) (scroll-down 1))) ; For scrolling up
(global-set-key [mouse-5] (lambda () (interactive) (scroll-up 1))) ; For scrolling down

(provide 'init-term-mouse)
