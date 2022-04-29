;;; game-master-assistant.el -- Roll playing Game Master helper functions -*- lexical-binding: t; -*-
;;
;;; Copyright (C) 2022 Kyle W T Sherman
;;
;; Author: Kyle W T Sherman <kylewsherman@gmail.com>
;; URL: https://github.com/nullman/emacs-game-master-assistant
;; Created: 2022-02-19
;; Version: 1.0
;; Keywords: game
;; Package-Requires:
;;
;; This file is not part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or modify it under
;; the terms of the GNU General Public License as published by the Free Software
;; Foundation; either version 2 of the License, or (at your option) any later
;; version.
;;
;; This program is distributed in the hope that it will be useful, but WITHOUT
;; ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
;; FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License along with
;; this program; if not, write to the Free Software Foundation, Inc., 51 Franklin
;; Street, Fifth Floor, Boston, MA 02110-1301 USA.
;;
;;; Commentary:
;;
;; Provides ...
;;
;;; Installation:
;;
;; Put `game-master-assistant.el' where you keep your elisp files and add
;; something like the following to your .emacs file:
;;
;;   (require 'game-master-assistant)
;;
;;; Usage:
;;

;;; Code:

(require 'game-master-assistant-lists)

(defvar game-master-assistant-random-queries
  '()
  "An alist of random query names, descriptions, and code that can
be evaluated to generate a random result.

Format:

  '((NAME-1 . DESC-1 . LAMBDA-1)
    (NAME-2 . DESC-2 . LAMBDA-2)
    ...
    (NAME-N . DESC-N . LAMBDA-N))")

(defvar game-master-assistant-random-query-history
  '()
  "History of `game-master-assistant-random-query' name arguments.")

;; (defmacro game-master-assistant--defun-with-result-to-kill-ring (name arglist &optional docstring &rest body)
;;   "Return a `defun' with its result copied to the `kill-ring'."
;;   (declare (doc-string 3) (indent 2))
;;   `(defun ,name ,arglist ,docstring (kill-new (progn ,@body))))

;; (defmacro game-master-assistant--lambda-with-result-to-kill-ring (name &rest body)
;;   "Return a lambda with its result copied to the `kill-ring'."
;;   `(lambda () (kill-new (progn ,@body))))

(defun game-master-assistant-random-value (name)
  "Return a random value from random list NAME.

Where NAME is a list name in `game-master-assistant-list-names'."
  (let* ((values (game-master-assistant-list name))
         (len (length values)))
    (capitalize (nth (random len) values))))

(defun game-master-assistant-random-query (&optional name)
  "Return a random value from random query NAME,

Where NAME is a query name in `game-master-assistant-random-queries'."
  (interactive)
  (let ((name (or name
                  (read-from-minibuffer "Name: "
                                        (car game-master-assistant-random-query-history)
                                        nil nil
                                        'game-master-assistant-random-query-history))))
    (funcall (cddr (assoc name game-master-assistant-random-queries)))))

;;; Single List Queries

(dolist (name game-master-assistant-random-list-names)
  (add-to-list
   'game-master-assistant-random-queries
   (cons name
         (cons (get (game-master-assistant-list-name name) 'variable-documentation)
               `(lambda () (kill-new (game-master-assistant-random-value ,name)))))))

;;; Custom Queries: Names

(defmacro game-master-assistant--add-name-query (type gender)
  "Add a full name query entry to `game-master-assistant-random-queries',
using TYPE and GENDER."
  `(add-to-list
    'game-master-assistant-random-queries
    (cons ,(format "noun-name-%s-%s-full" type gender)
          (cons ,(format "Return a random %s %s full name." (capitalize type) gender)
                (lambda ()
                  (kill-new
                   (concat
                    (game-master-assistant-random-value ,(format "noun-name-%s-%s-given" type gender))
                    " "
                    (game-master-assistant-random-value ,(format "noun-name-%s-surname" type gender)))))))))

(game-master-assistant--add-name-query "english" "male")
(game-master-assistant--add-name-query "english" "female")
(game-master-assistant--add-name-query "viking" "male")
(game-master-assistant--add-name-query "viking" "female")

;;; Custom Queries: Places

(add-to-list
 'game-master-assistant-random-queries
 (cons "noun-place-tavern"
       (cons "Return a random tavern name."
             `(lambda ()
                  (kill-new
                   (concat
                    "The "
                    (game-master-assistant-random-value "adjective-tavern")
                    " "
                    (game-master-assistant-random-value "noun-place")))))))

;;; Ironsworn

;;; Set Random Query History
(setq game-master-assistant-random-query-history (mapcar 'car game-master-assistant-random-queries))

(provide 'game-master-assistant)

;;; game-master-assistant.el ends here
