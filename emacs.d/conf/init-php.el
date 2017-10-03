(require 'cl)
(require 'php-mode)

(add-hook 'php-mode-hook
          '(lambda ()
             (auto-complete-mode t)
             (require 'ac-php)
             (setq ac-sources  '(ac-source-php) )
             (yas-global-mode 1)
             (ac-php-core-eldoc-setup) ;; enable eldoc-setup
             (require 'company-php)
             (company-mode t)
             (add-to-list 'company-backends 'company-ac-php-backend )
             ; (define-key php-mode-map  (kbd "C-]") 'ac-php-find-symbol-at-point) ;goto define-key
             ; (define-key php-mode-map  (kbd "C-t") 'ac-php-location-stack-back)  ;go back
             ))

; タグジャンプ設定
(add-hook 'helm-gtags-mode-hook
          '(lambda ()
             ;;入力されたタグの定義元へジャンプ
             (local-set-key (kbd "M-t") 'helm-gtags-find-tag)
             ;;入力タグを参照する場所へジャンプ
             (local-set-key (kbd "M-u") 'helm-gtags-find-rtag)
             ;;入力したシンボルを参照する場所へジャンプ
             (local-set-key (kbd "M-s") 'helm-gtags-find-symbol)
             ;;タグ一覧からタグを選択し, その定義元にジャンプする
             (local-set-key (kbd "M-l") 'helm-gtags-select)
             ;;ジャンプ前の場所に戻る
             (local-set-key (kbd "M-*") 'helm-gtags-pop-stack)))
(add-hook 'php-mode-hook 'helm-gtags-mode)

; 構文エラーチェック設定
(add-hook 'after-init-hook #'global-flycheck-mode)
