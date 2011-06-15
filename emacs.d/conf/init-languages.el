;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

;; grepをackに変更
;; 事前にackをcpanでインストールすること。debianパッケージだと、ack-grep
;; (setq grep-command "ack -a --nocolor ")
;; (defun ack ()
;;   (interactive)
;;   (let ((grep-find-command "ack --nocolor --nogroup "))
;;     (call-interactively 'grep-find)))

;; brackets.el
;; 対応する括弧を自動補完。各言語モードで設定
;; (load "brackets.el")

;; shellっぽいところで、C-n/pでヒストリ
;; (define-key comint-mode-map "\C-p" 'comint-previous-input)
;; (define-key comint-mode-map  "\C-n" 'comint-next-input)

;; リージョンを自動的に囲む
;; http://sami.samhuri.net/2007/6/23/emacs-for-textmate-junkies
;; (defun wrap-region (left right beg end)
;;   "Wrap the region in arbitrary text, LEFT goes to the left and RIGHT goes to the right."
;;   (interactive)
;;   (save-excursion
;;     (goto-char beg)
;;     (insert left)
;;     (goto-char (+ end (length left)))
;;     (insert right)))
;; 
;; (defmacro wrap-region-with-function (left right)
;;   "Returns a function which, when called, will interactively `wrap-region-or-insert' using LEFT and RIGHT."
;;   `(lambda () (interactive)
;;      (wrap-region-or-insert ,left ,right)))
;; 
;; (defun wrap-region-with-tag-or-insert ()
;;   (interactive)
;;   (if (and mark-active transient-mark-mode)
;;       (call-interactively 'wrap-region-with-tag)
;;     (insert "<")))
;; 
;; (defun wrap-region-with-tag (tag beg end)
;;   "Wrap the region in the given HTML/XML tag using `wrap-region'. If any
;; attributes are specified then they are only included in the opening tag."
;;   (interactive "*sTag (including attributes): \nr")
;;   (let* ((elems    (split-string tag " "))
;;          (tag-name (car elems))
;;          (right    (concat "</" tag-name ">")))
;;     (if (= 1 (length elems))
;;         (wrap-region (concat "<" tag-name ">") right beg end)
;;       (wrap-region (concat "<" tag ">") right beg end))))
;; 
;; (defun wrap-region-or-insert (left right)
;;   "Wrap the region with `wrap-region' if an active region is marked, otherwise insert LEFT at point."
;;   (interactive)
;;   (if (and mark-active transient-mark-mode)
;;       (wrap-region left right (region-beginning) (region-end))
;;     (insert left)))
;; 
;; (global-set-key "'"  (wrap-region-with-function "'" "'"))
;; (global-set-key "\"" (wrap-region-with-function "\"" "\""))
;; (global-set-key "`"  (wrap-region-with-function "`" "`"))
;; (global-set-key "("  (wrap-region-with-function "(" ")"))
;; (global-set-key "["  (wrap-region-with-function "[" "]"))
;; (global-set-key "{"  (wrap-region-with-function "{" "}"))
;; (global-set-key "<"  'wrap-region-with-tag-or-insert)

;(set-language-environment "Japanese")
;(setq default-buffer-coding-sytem 'utf-8)
; (prefer-coding-system 'utf-8-unix)
; (set-default-coding-systems 'utf-8-unix)
; (set-terminal-coding-system 'utf-8-unix)
; (set-keyboard-coding-system 'shift_jis-unix)
; (set-buffer-file-coding-system 'utf-8-unix)

(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)