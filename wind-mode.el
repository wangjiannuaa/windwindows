;;; wind-mode.el --- Support for computer programming language  -*- lexical-binding: t; -*-

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

;;;###autoload
(define-minor-mode wind-mode
  "wind mode"
  :init-value  nil
  :lighter " WD"
  :keymap '(([C-w-~] . openwindwindows) ([C-w-!] . closewindwindows))
  :group 'wind-mode-group
  (if wind-mode
      (progn
        (wd-setup)
        (add-hook 'pre-command-hook 'wd-handle-pre-command nil t)
        (add-hook 'powd-command-hook 'wd-handle-post-command nil t)
        (add-hook 'after-save-hook 'wd-clear-variables-after-save nil t)
        (run-hooks 'wind-mode-hook))
    (remove-hook 'pre-command-hook 'wd-handle-pre-command t)
    (remove-hook 'post-command-hook 'wd-handle-post-command t)
    (remove-hook 'after-save-hook 'wd-clear-variables-after-save t)
    (wd-abort))
  )

(defun wd-handle-pre-command()
  (message "pre")
  )
(defun wd-handle-post-command()
  (message "post")
  )
  (defun wd-clear-variables-after-save()
    (message "clear")
  )


(defun wind-mode-hook()
  (message "I'm in wind-mode")
)


(defun wd-setup()
  (message "I'm in wd-setup"))
(defun wd-abort()
  (message "I'm in wd-abort"))


;;;###autoload
(defun openwindwindows()
"open wind windows for wind feeling."
(message "open wind windows.")
   (let* (of (selected-frame))
         (nf (make-frame-command))
         (font1 (frame-parameter of 'font))
   )

  ;;;(save-selected-window (select-frame of) (set-frame-font font1))
)

;;;###autoload
(defun closewindwindows()
"close wind windows for wind feeling."
(message "close wind windows.")
)


(defun apropos (cur buffer)
 "a VR target"
 (message "target:%s" 'cur) 
)
(defun wind (context)
  "basic operator"
  (message "basic operator to %s" 'context)
   ;;;(semantic-analyze-contex context)
)


(defun imenuextforwind (buffer)
  "interactive vr with cursor"
  (interactive "P\nb\nenter a buffer name:")
  (let* (cur (point))
        (curtext (apropos cur buffer)))
  (wind curtext) 
)

;;;(defgroup)
;;;(defcustom)
(global-set-key (kbd "C-M-.") 'imenuextforwind)

(provide 'wind-mode)
