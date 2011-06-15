;; typester さんの clmemo から
;; http://unknownplace.org/memo/2006/09/20#e002
; インクリメンタルにバッファきりかえられるやつ。必須すぎ
(when run-emacs21
  (iswitchb-default-keybindings)) ; emacs21の人はこっち
(when run-emacs22
  (iswitchb-mode 1)) ; emacs22の人はこっち

; 同じ名前のバッファがあった場合上の階層のディレクトリとかも一緒に出して区別できるようにユニークなバッファ名にしてくれるやつ
; コレも必須
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

; インデントに tab を使用しない
(setq-default indent-tabs-mode nil)

;; http://dev.ariel-networks.com/Members/matsuyama/auto-complete
; 開いてるバッファ内の文字列から補完候補を出してくれる
(unless run-emacs21
  (progn (require 'auto-complete)
         (global-auto-complete-mode t))
  nil)

;; (setq visible-bell t)
