;;; game-master-assistant-ironsworn-lists.el -- Roll playing Game Master helper functions -*- lexical-binding: t; -*-
;;
;;; Copyright (C) 2022 Kyle W T Sherman
;;
;; Author: Kyle W T Sherman <kylewsherman@gmail.com>
;; URL: https://github.com/nullman/emacs-game-master-assistant
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
;; Ironsworn lists for `game-master-assistant'.

;;; Code:

(defvar game-master-assistant-ironsworn-lists-types
  '()
  "Ironsworn list types that can be queried.")

(defvar game-master-assistant-ironsworn-list-oracle-action
  (quote ((1 "Scheme") (2 "Clash") (3 "Weaken") (4 "Initiate") (5 "Create") (6 "Swear") (7 "Avenge") (8 "Guard") (9 "Defeat") (10 "Control") (11 "Break") (12 "Risk") (13 "Surrender") (14 "Inspect") (15 "Raid") (16 "Evade") (17 "Assault") (18 "Deflect") (19 "Threaten") (20 "Attack") (21 "Leave") (22 "Preserve") (23 "Manipulate") (24 "Remove") (25 "Eliminate") (26 "Withdraw") (27 "Abandon") (28 "Investigate") (29 "Hold") (30 "Focus") (31 "Uncover") (32 "Breach") (33 "Aid") (34 "Uphold") (35 "Falter") (36 "Suppress") (37 "Hunt") (38 "Share") (39 "Destroy") (40 "Avoid") (41 "Reject") (42 "Demand") (43 "Explore") (44 "Bolster") (45 "Seize") (46 "Mourn") (47 "Reveal") (48 "Gather") (49 "Defy") (50 "Transform") (51 "Persevere") (52 "Serve") (53 "Begin") (54 "Move") (55 "Coordinate") (56 "Resist") (57 "Await") (58 "Impress") (59 "Take") (60 "Oppose") (61 "Capture") (62 "Overwhelm") (63 "Challenge") (64 "Acquire") (65 "Protect") (66 "Finish") (67 "Strengthen") (68 "Restore") (69 "Advance") (70 "Command") (71 "Refuse") (72 "Find") (73 "Deliver") (74 "Hide") (75 "Fortify") (76 "Betray") (77 "Secure") (78 "Arrive") (79 "Affect") (80 "Change") (81 "Defend") (82 "Debate") (83 "Support") (84 "Follow") (85 "Construct") (86 "Locate") (87 "Endure") (88 "Release") (89 "Lose") (90 "Reduce") (91 "Escalate") (92 "Distract") (93 "Journey") (94 "Escort") (95 "Learn") (96 "Communicate") (97 "Depart") (98 "Search") (99 "Charge") (0 "Summon")))
  "List of Ironsworn Oracle actions.")

(add-to-list 'game-master-assistant-ironsworn-lists-types :oracle-action)

(defvar game-master-assistant-ironsworn-list-oracle-theme
  (quote ((1 "Risk") (2 "Ability") (3 "Price") (4 "Ally") (5 "Battle") (6 "Safety") (7 "Survival") (8 "Weapon") (9 "Wound") (10 "Shelter") (11 "Leader") (12 "Fear") (13 "Time") (14 "Duty") (15 "Secret") (16 "Innocence") (17 "Renown") (18 "Direction") (19 "Death") (20 "Honor") (21 "Labor") (22 "Solution") (23 "Tool") (24 "Balance") (25 "Love") (26 "Barrier") (27 "Creation") (28 "Decay") (29 "Trade") (30 "Bond") (31 "Hope") (32 "Superstition") (33 "Peace") (34 "Deception") (35 "History") (36 "World") (37 "Vow") (38 "Protection") (39 "Nature") (40 "Opinion") (41 "Burden") (42 "Vengeance") (43 "Opportunity") (44 "Faction") (45 "Danger") (46 "Corruption") (47 "Freedom") (48 "Debt") (49 "Hate") (50 "Possession") (51 "Stranger") (52 "Passage") (53 "Land") (54 "Creature") (55 "Disease") (56 "Advantage") (57 "Blood") (58 "Language") (59 "Rumor") (60 "Weakness") (61 "Greed") (62 "Family") (63 "Resource") (64 "Structure") (65 "Dream") (66 "Community") (67 "War") (68 "Portent") (69 "Prize") (70 "Destiny") (71 "Momentum") (72 "Power") (73 "Memory") (74 "Ruin") (75 "Mysticism") (76 "Rival") (77 "Problem") (78 "Idea") (79 "Revenge") (80 "Health") (81 "Fellowship") (82 "Enemy") (83 "Religion") (84 "Spirit") (85 "Fame") (86 "Desolation") (87 "Strength") (88 "Knowledge") (89 "Truth") (90 "Quest") (91 "Pride") (92 "Loss") (93 "Law") (94 "Path") (95 "Warning") (96 "Relationship") (97 "Wealth") (98 "Home") (99 "Strategy") (0 "Supply")))
  "List of Ironsworn Oracle themes.")

(add-to-list 'game-master-assistant-ironsworn-lists-types :oracle-theme)

(defun game-master-assistant-get-ironsworn-list (type)
  "Return ironsworn list for TYPE.

Where TYPE is one of:

  :oracle-action
  :oracle-theme"
  (mapcar #'cadr (symbol-value
                  (intern
                   (concat "game-master-assistant-ironsworn-list-"
                           (substring (format "%s" type) 1))))))

(provide 'game-master-assistant-ironsworn-lists)

;;; game-master-assistant-ironsworn-lists.el ends here
