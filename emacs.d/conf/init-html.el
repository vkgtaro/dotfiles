(autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)
(setq auto-mode-alist
      (append '(("\\.html$" . html-helper-mode)
                ("\\.tt$" . html-helper-mode)
                ("\\.tx$" . html-helper-mode)) auto-mode-alist))
(add-hook 'html-helper-load-hook
          '(lambda () (require 'html-font)))
(require 'html-tt)
(add-hook 'html-helper-mode-hook 'html-tt-load-hook)

(when run-emacs22
  (delete 'sgml-html-meta-auto-coding-function auto-coding-functions) )

;; Setting values:
(make-face 'my-sequence-face)
(set-face-foreground 'my-sequence-face "blue")
(set-face-background 'my-sequence-face "bisque")
(setq html-tt-sequence-face 'my-sequence-face)

;; or
(setq html-tt-sequence-face 'bold)
(setq html-tt-sequence-face 'italic)
(setq html-tt-sequence-face 'underline)

;; For TT
(setq html-tt-sequence-start "[% ")
(setq html-tt-sequence-end " %]")
