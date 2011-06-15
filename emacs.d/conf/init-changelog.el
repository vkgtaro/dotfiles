(setq user-full-name "Daisuke Komatsu")
(setq user-mail-address "viking@taro-web.com")
(autoload 'clmemo "clmemo" "ChangeLog memo mode." t)
(setq clmemo-file-name "~/memo/diary.txt")
(global-set-key "\C-xM" 'clmemo)
(setq clmemo-subtitle-char "["
      clmemo-subtitle-punctuation-char '(" [" . "]")
      clmemo-time-string-with-weekday t)

(defun my-clmemo-title-formatting (title)
  (setq title (concat (format-time-string "%H:%M " (current-time)) title)))
(setq clmemo-title-format-function 'my-clmemo-title-formatting)
