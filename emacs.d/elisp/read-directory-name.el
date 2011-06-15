;; -*- Mode: Emacs-Lisp -*-
;;
;; read-directory-name.el (was directory-complete.el)
;;
(defconst read-directory-name-version "0.2 (August 9, 2004)")
;;
;; Author:   Naoto Morishima <naoto@dl.naist.jp>
;;              Nara Institute of Science and Technology, Japan
;; Created:  November 17, 1996
;; Revised:  August 9, 2004

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.

(provide 'read-directory-name)


;;; Code;

(defun read-directory-name (prompt &optional dir default-dirname mustmatch initial)
  (completing-read prompt 'directory-name-completion nil mustmatch
		   dir nil default-dirname))

(defun directory-name-completion (string predicate flag)
  (let* ((directory-part (or (file-name-directory string) ""))
	 (nondirectory-part (or (file-name-nondirectory string) ""))
	 (collection nil))
    (cond
     ((not (file-directory-p directory-part))
      nil)
     (t
      (setq collection
	    (delq nil
		  (mapcar
		   (lambda (file)
		     (when (file-directory-p (concat directory-part file))
		       (cons (concat file "/") file)))
		   (directory-files directory-part))))))
    (cond
     (flag
      (all-completions nondirectory-part collection predicate))
     ((eq (length collection) 2) ; only ../ and ./
      t)
     (t
      (setq completed (try-completion nondirectory-part collection predicate))
      (cond
       ((stringp completed)
	(concat directory-part completed))
       (t
	completed))))))
