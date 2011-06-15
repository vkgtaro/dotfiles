(setq auto-mode-alist (cons '("\\.mk\\'" . makefile-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons
       '("\\(M\\|m\\|GNUm\\)akefile\\(\\.in\\)?\\'" . makefile-mode)
       auto-mode-alist))
(setq auto-mode-alist
      (cons
       '("\\(M\\|m\\|GNUm\\)kinclude\\(\\.in\\)?\\'" . makefile-mode)
       auto-mode-alist))
(setq auto-mode-alist
      (cons
       '("\\(C\\|c\\)onfig\\(\\.mk\\|.mk.in\\)?\\'" . makefile-mode)
       auto-mode-alist))
