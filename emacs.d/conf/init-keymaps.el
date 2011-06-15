(global-set-key [delete] 'delete-char)
(global-set-key [kp-delete] 'delete-char)
(define-key global-map "\C-h" 'delete-backward-char)
(define-key global-map "\C-ci" 'indent-region)
(define-key global-map "\C-c\C-i" 'dabbrev-expand)

;;RET に newline-and-indent を割り当てる
(global-set-key "\C-m" 'newline-and-indent)

;; 一行ずつスクロール
(setq scroll-conservatively 35
       scroll-margin 0
       scroll-step 1)
(setq comint-scroll-show-maximum-output t)

; カーソル位置を維持したままスクロール
(defun scroll-up-in-place (n)
    (interactive "p")
      (previous-line n)
        (scroll-down n))

(defun scroll-down-in-place (n)
    (interactive "p")
      (next-line n)
        (scroll-up n))

(global-set-key "\M-p" 'scroll-up-in-place)
(global-set-key [M-up] 'scroll-up-in-place)
(global-set-key "\M-n" 'scroll-down-in-place)
(global-set-key [M-down] 'scroll-down-in-place)

; replace-regexp
(global-set-key "\M-r" 'replace-regexp)
