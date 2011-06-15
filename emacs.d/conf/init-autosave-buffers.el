;; オートセーブファイルを終了時削除
(setq delete-auto-save-files t)

;; バックアップファイルを作らない
(setq backup-inhibited t)

;; 自動セーブ
(require 'auto-save-buffers)
(run-with-idle-timer 0.5 t 'auto-save-buffers)
