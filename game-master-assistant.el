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
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License along
;; with this program; if not, write to the Free Software Foundation, Inc.,
;; 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
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

(require 'game-master-assistant-name-lists)
(require 'game-master-assistant-places-lists)
(require 'game-master-assistant-ironsworn-lists)

(defmacro game-master--defun-with-result-to-kill-ring (name arglist &optional docstring &rest body)
  "Return a `defun' with its result copied to the `kill-ring'"
  (declare (doc-string 3) (indent 2))
  `(defun ,name ,arglist ,docstring (kill-new (progn ,@body))))

(defun game-master-assistant-random-name (type)
  "Return a random name of TYPE.

Where TYPE is in one of these lists:

  `game-master-assistant-name-lists-types'
  `game-master-assistant-places-lists-types'"
  (let* ((names (or
                 (ignore-errors (game-master-assistant-get-name-list type))
                 (ignore-errors (game-master-assistant-get-places-list type))))
         (len (length names)))
    (capitalize (nth (random len) names))))

;;; Names

(game-master--defun-with-result-to-kill-ring
    game-master-assistant-random-english-male-name ()
  "Return a random English male full name."
  (concat
   (game-master-assistant-random-name :english-male-given-name)
   " "
   (game-master-assistant-random-name :english-surname)))

(game-master--defun-with-result-to-kill-ring
    game-master-assistant-random-english-female-name ()
  "Return a random English female full name."
  (concat
   (game-master-assistant-random-name :english-female-given-name)
   " "
   (game-master-assistant-random-name :english-surname)))

(game-master--defun-with-result-to-kill-ring
    game-master-assistant-random-viking-male-name ()
  "Return a random Viking male full name."
  (concat
   (game-master-assistant-random-name :viking-male-given-name)
   " "
   (game-master-assistant-random-name :viking-surname)))

(game-master--defun-with-result-to-kill-ring
    game-master-assistant-random-viking-female-name ()
  "Return a random Viking female full name."
  (concat
   (game-master-assistant-random-name :viking-female-given-name)
   " "
   (game-master-assistant-random-name :viking-surname)))

;;; Places

(game-master--defun-with-result-to-kill-ring
    game-master-assistant-random-tavern-name ()
  "Return a random tavern name."
  (concat
   "The "
   (game-master-assistant-random-name :adjective-general)
   " "
   (game-master-assistant-random-name :noun-tavern)))

(game-master--defun-with-result-to-kill-ring
    game-master-assistant-random-viking-town ()
  "Return a random Viking town name."
  (game-master-assistant-random-name :viking-town))

;;; Ironsworn

(defun game-master-assistant-ironsworn (type)
  "Return a random Ironsworn lookup of TYPE.

Where TYPE is one of:

  :oracle-action
  :oracle-theme"
  (let* ((names (game-master-assistant-get-ironsworn-list type))
         (len (length names)))
    (capitalize (nth (random len) names))))

(game-master--defun-with-result-to-kill-ring
    game-master-assistant-ironsworn-oracle-action ()
  "Return an Ironsworn Oracle action."
  (game-master-assistant-ironsworn :oracle-action))

(game-master--defun-with-result-to-kill-ring
    game-master-assistant-ironsworn-oracle-theme ()
  "Return an Ironsworn Oracle theme."
  (game-master-assistant-ironsworn :oracle-theme))

(provide 'game-master-assistant)

;;; game-master-assistant.el ends here
