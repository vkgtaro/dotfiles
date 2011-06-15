(autoload 'css-mode "css-mode" "css" t)
(setq auto-mode-alist
            (cons
                    '("\\.css$" . css-mode) auto-mode-alist))
(setq cssm-indent-function #'cssm-c-style-indenter)
(setq cssm-indent-level 4)
