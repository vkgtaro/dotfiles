;; OS X でバックスラッシュが円記号になるのを回避
(define-key global-map [?¥] "\\")

;; option キー → Meta
(setq mac-option-modifier 'alt)
(setq mac-option-modifier 'meta)

(set-language-environment "Japanese")
(set-default-coding-systems 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)

;; Carbon Emacs のために色つけ
(if window-system
    (progn
      ;;(load "carbon-font")
      ;; Window size
      (setq initial-frame-alist '((width . 80) (height . 44)))
      ;; 文字の色を設定します。
      (add-to-list 'default-frame-alist '(foreground-color . "white"))
      ;; 背景色を設定します。
      (add-to-list 'default-frame-alist '(background-color . "black"))
      ;; カーソルの色を設定します。
      (add-to-list 'default-frame-alist '(cursor-color . "LimeGreen"))
      ;; マウスポインタの色を設定します。
      (add-to-list 'default-frame-alist '(mouse-color . "ForestGreen"))
      ;; モードラインの文字の色を設定します。
      (set-face-foreground 'modeline "white")
      ;; モードラインの背景色を設定します。
      (set-face-background 'modeline "RoyalBlue")
      ;; 選択中のリージョンの色を設定します。
      (set-face-background 'region "RoyalBlue")

      ;; 半透明
      ;;(add-to-list 'default-frame-alist   '(active-alpha . 0.90))
      ;;(add-to-list 'default-frame-alist '(inactive-alpha . 0.40))

      (set-face-foreground 'font-lock-comment-face "firebrick")
      (set-face-foreground 'font-lock-string-face  "ForestGreen")
      (set-face-foreground 'font-lock-keyword-face "RoyalBlue")
      (set-face-foreground 'font-lock-function-name-face "DodgerBlue")
      (set-face-bold-p 'font-lock-function-name-face t)
      (set-face-foreground 'font-lock-variable-name-face "GoldenRod")
      (set-face-foreground 'font-lock-type-face "LightSeaGreen")
      (set-face-foreground 'font-lock-builtin-face "purple")
      (set-face-foreground 'font-lock-constant-face "DarkMagenta")
      (set-face-foreground 'font-lock-warning-face "blue")
      (set-face-bold-p 'font-lock-warning-face nil)

      ; carbon emacs でフォント設定
      (create-fontset-from-ascii-font "Menlo-14:weight=normal:slant=normal" nil "menlokakugo")
      (set-fontset-font "fontset-menlokakugo"
                        'unicode
                        (font-spec :family "Hiragino Kaku Gothic ProN" :size 16)
                        nil
                        'append)
      (add-to-list 'default-frame-alist '(font . "fontset-menlokakugo"))

      ; http://d.hatena.ne.jp/kazu-yamamoto/20090122/1232589385
;;      (setq my-font "-*-*-medium-r-normal--12-*-*-*-*-*-fontset-hiramaru")
;;      (setq fixed-width-use-QuickDraw-for-ascii t)
;;      (setq mac-allow-anti-aliasing t)
;;      (if (= emacs-major-version 22)
;;          (require 'carbon-font))
;;      (set-default-font my-font)
;;      (add-to-list 'default-frame-alist `(font . ,my-font))
;;      (when (= emacs-major-version 23)
;;        (set-fontset-font
;;         (frame-parameter nil 'font)
;;         'japanese-jisx0208
;;         '("Hiragino Maru Gothic Pro" . "iso10646-1"))
;;        (setq face-font-rescale-alist
;;              '(("^-apple-hiragino.*" . 1.2)
;;                (".*osaka-bold.*" . 1.2)
;;                (".*osaka-medium.*" . 1.2)
;;                (".*courier-bold-.*-mac-roman" . 1.0)
;;                (".*monaco cy-bold-.*-mac-cyrillic" . 0.9)
;;                (".*monaco-bold-.*-mac-roman" . 0.9)
;;                ("-cdac$" . 1.3))))

      ))

(put 'dired-find-alternate-file 'disabled nil)

; 背景色半透明
(setq default-frame-alist
      (append (list
               '(alpha . (nil 85 50 30))
               )
              default-frame-alist))

(defun macp () (eq window-system 'mac))

(when (macp)
  (mac-add-ignore-shortcut '(control ? )))

(put 'set-goal-column 'disabled nil)

