;;; wind.el --- Support for computer programming language  -*- lexical-binding: t; -*-

;; Copyright (C) 2024-2025 Jian .P. Wang


;; Author: Wang Jian <wangjiantsinghua@qq.com>
;; Maintainer: Someone Else <someone@example.com>
;; Created: 14 Jul 2010

;; Keywords: 
;; URL: https://alllala.com/index

;; This file is not part of GNU Emacs.

;; This file is free software

;; along with this file.  If not, see <https://www.gnu.org/licenses/>.
(require 'semantic)
(require 'imenu)
(require 'also-common)

;;;###autoload
(defun wind-open-windows (arg)
  "open windows for wind speculators"
  (interactive "bbuffer:")
  (make-frame-command)
 ;;;   (let* (of (selected-frame))
 ;;;         (nf (make-frame-command))
;;;          (font1 (frame-parameter of 'font)))

;;;    (save-selected-window (select-frame nf) (set-frame-font font1))
 ;;;   (message "open wind windows %s." arg)
    
)

;;;###autoload
(defun wind-close-windows (buffer)
  "close windows for wind speculators"
  (interactive "bbuffer:")
;;   (interactive "@\n" (let curframe (selected-frame)))
;;   (delete-frame curframe)
)





(defgroup wind-tech nil
  "Wind Technique."
  :prefix "wind-"
  :group 'convenience
  )






(defvar wind-mode nil
  "Dummy variable to suppress compiler warnings.")

;;;###autoload
(define-minor-mode wind-mode
  "wind mode"
  :init-value  nil
  :lighter " ST"
  :group 'wind-tech
  (if wind-mode
      (progn
        (wind-setup)
        (add-hook 'pre-command-hook 'wind-handle-pre-command nil t)
        (add-hook 'post--command-hook 'wind-handle-post-command nil t)
        (add-hook 'after-save-hook 'wind-clear-variables-after-save nil t)
        (run-hooks 'wind-mode-hook))
    (remove-hook 'pre-command-hook 'wind-handle-pre-command t)
    (remove-hook 'post-command-hook 'wind-handle-post-command t)
    (remove-hook 'after-save-hook 'wind-clear-variables-after-save t)
    (wind-abort))
  )

(defun wind-handle-pre-command ()
  (message "pre")
)
(defun wind-handle-post-command ()
  (message "post")
)
(defun wind-clear-variables-after-save ()
  (message "clear")
)
(defun wind-mode-hook ()
  (message "Im in wind-mode")
)
(defun wind-setup ()
  "define keymap"
  (message "Im in wind-setup")
  (define-key wind-mode-map (kbd "C-M-*") #'wd-open-windows)
  (define-key wind-mode-map (kbd "C-M-!") #'wd-close-windows)


  (message "Im out wind-abort")
)
(defun wind-abort ()
  "undefine keymap"
  (message "Im in wind-abort")
)


(defun wind-apropos (cur buffer)
 "a MR target"
)
(defun wind (context)
  "advanced operator"
)

;;;###autoload
(defun imenu-extension-for-wind (buffer)
  "interactive ar-aided vr-targeted mr-selection with cursor"
   (interactive "P\nb\nenter a buffer name:")
   (let* (cur (point))
         (curtext (apropos cur buffer))
	 (wind curtext)
   )
)

;;;(defgroup)
;;;(defcustom)
(global-set-key (kbd "C-M-,") 'imenu-extension-for-wind)

(provide 'wind-mode)
