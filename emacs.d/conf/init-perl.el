(defalias 'perl-mode 'cperl-mode)
(setq cperl-auto-newline t)
(setq cperl-indent-parens-as-block t)
(setq cperl-close-paren-offset -4)
(setq cperl-indent-level 4)
(setq cperl-label-offset -4)
(setq cperl-continued-statement-offset 1)
(setq cperl-highlight-variables-indiscriminately t)

; perl-completion-mode
(add-hook 'cperl-mode-hook
          (lambda()
            (require 'perl-completion)
            (perl-completion-mode t)))

; テストファイルも cperl-mode で開くようにする
(setq auto-mode-alist
      (append '(("\\.t$" . cperl-mode)
                ("\\.psgi$" . cperl-mode)) auto-mode-alist))

;;; perltidy-region powered by typester
(defun perltidy-region ()
  "Run perltidy on the current region."
  (interactive)
  (save-excursion
    (shell-command-on-region (point) (mark) "perltidy -q" nil t)))
(defun perltidy-defun ()
  "Run perltidy on the current defun."
  (interactive)
  (save-excursion (mark-defun)
                  (perltidy-region)))
(defun perltidy-buffer ()
  "Run perltidy on the current buffer."
  (interactive)
  (save-excursion (mark-whole-buffer)
                  (perltidy-region)))
(global-set-key "\C-ct" 'perltidy-region)

(defun my-insert-date () ; 日付入れる関数。perlモジュールのChanges書くときに主に使用
  (interactive)
  (insert (format-time-string "%Y-%m-%dT%R:%S+09:00" (current-time))))

