;;-*- coding: utf-8 -*-
;; diffusion-log.el -- highlighting for Diffusion Logs
;;
;; Copyright (C) 2014 Push Technology, Ltd
;; Author: Philip Aston
;; Keywords: faces


(defgroup diffusion-log-mode nil
  "View Diffusion log files.")

(defgroup diffusion-log-mode-faces nil
  "Faces for diffusion-log-mode."
  :prefix "diffusion-log-"
  :group 'diffusion-log-mode)

(defface diffusion-log-face-trace
  '((((class color)) (:foreground "gray")))
  "Face for TRACE severity token."
  :group 'diffusion-log-mode-faces)

(defface diffusion-log-face-debug
  '((((class color)) (:foreground "lightskyblue1")))
  "Face for DEBUG severity token."
  :group 'diffusion-log-mode-faces)

(defface diffusion-log-face-info
  '((((class color)) (:foreground "limegreen")))
  "Face for INFO severity token."
  :group 'diffusion-log-mode-faces)

(defface diffusion-log-face-warn
  '((((class color)) (:foreground "red")))
  "Face for WARN severity token."
  :group 'diffusion-log-mode-faces)

(defface diffusion-log-face-error
  '((((class color)) (:foreground "white" :background "red3")))
  "Face for ERROR severity token."
  :group 'diffusion-log-mode-faces)

(defface diffusion-log-face-separator
  '((((class color)) (:foreground "orange")))
  "Face for the field separator character."
  :group 'diffusion-log-mode-faces)

(defface diffusion-log-face-message-field
  '((((class color)) (:foreground "palegreen2" :inherit variable-pitch)))
  "Face for the message field."
  :group 'diffusion-log-mode-faces)

(defface diffusion-log-face-code-field
  '((((class color)) (:foreground "black")))
  "Face for the message code field."
  :group 'diffusion-log-mode-faces)

(defface diffusion-log-face-logger-field
  '((((class color)) (:foreground "#cb4b16")))
  "Face for the logger field."
  :group 'diffusion-log-mode-faces)

(defface diffusion-log-face-exception
  '((((class color)) (:height 0.8)))
  "Face for the non-formatted lines - typically exception traces."
  :group 'diffusion-log-mode-faces)

(defvar diffusion-log-mode-font-lock-defaults nil
  "Diffusion log mode font-lock-defaults.")

(defcustom diffusion-log-mode-hook
  nil
  "Normal hook run when starting to view a Diffusion log file."
  :type 'hook
  :group 'diffusion-log-mode)

(setq diffusion-log-mode-font-lock-defaults
      '(
        ("|\\(TRACE\\)|" 1 'diffusion-log-face-trace t)
        ("|\\(DEBUG\\)|" 1 'diffusion-log-face-debug t)
        ("|\\(INFO\\)|" 1 'diffusion-log-face-info t)
        ("|\\(WARN\\)|" 1 'diffusion-log-face-warn t)
        ("|\\(ERROR\\)|" 1 'diffusion-log-face-error t)
        ("^[^|]*|[^|]*|[^|]*|\\([^|]*\\)" 1 'diffusion-log-face-code-field t)
        ("^[^|]*|[^|]*|[^|]*|[^|]*|\\([^|]*\\)" 1 'diffusion-log-face-message-field t)
        ("|\\([^|]*?\\)$" 1 'diffusion-log-face-logger-field t)
        ("|" . 'diffusion-log-face-separator)
        ("^[^|]*?$" . 'diffusion-log-face-exception)
        ))

(define-derived-mode diffusion-log-mode view-mode "Diffusion Log"
  "Major mode for viewing Diffusion log files.
Currently only provides syntax highlighting."
  (setq font-lock-defaults '(diffusion-log-mode-font-lock-defaults))
  )

(provide 'diffusion-log-mode)