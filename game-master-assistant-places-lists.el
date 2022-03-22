;;; game-master-assistant-places-lists.el -- Roll playing Game Master helper functions -*- lexical-binding: t; -*-
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
;; Places lists for `game-master-assistant'.

;;; Code:

(defvar game-master-assistant-places-lists-types
  '()
  "Places list types that can be queried.")

(defvar game-master-assistant-places-list-adjective-general
  (quote (("annoying") ("anxious") ("arrogant") ("ashamed") ("attractive") ("average") ("awful") ("bad") ("beautiful") ("better") ("bewildered") ("black") ("bloody") ("blue") ("blue-eyed") ("blushing") ("bored") ("brainy") ("brave") ("breakable") ("bright") ("busy") ("calm") ("careful") ("cautious") ("charming") ("cheerful") ("clean") ("clear") ("clever") ("cloudy") ("clumsy") ("colorful") ("combative") ("comfortable") ("concerned") ("condemned") ("confused") ("cooperative") ("courageous") ("crazy") ("creepy") ("crowded") ("cruel") ("curious") ("cute") ("dangerous") ("dark") ("dead") ("defeated") ("defiant") ("delightful") ("depressed") ("determined") ("different") ("difficult") ("disgusted") ("distinct") ("disturbed") ("dizzy") ("doubtful") ("drab") ("dull") ("eager") ("easy") ("elated") ("elegant") ("embarrassed") ("enchanting") ("encouraging") ("energetic") ("enthusiastic") ("envious") ("evil") ("excited") ("expensive") ("exuberant") ("fair") ("faithful") ("famous") ("fancy") ("fantastic") ("fierce") ("filthy") ("fine") ("foolish") ("fragile") ("frail") ("frantic") ("friendly") ("frightened") ("funny") ("gentle") ("gifted") ("glamorous") ("gleaming") ("glorious") ("good") ("gorgeous") ("graceful") ("grieving") ("grotesque") ("grumpy") ("handsome") ("happy") ("healthy") ("helpful") ("helpless") ("hilarious") ("homeless") ("homely") ("horrible") ("hungry") ("hurt") ("ill") ("important") ("impossible") ("inexpensive") ("innocent") ("inquisitive") ("itchy") ("jealous") ("jittery") ("jolly") ("joyous") ("kind") ("lazy") ("light") ("lively") ("lonely") ("long") ("lovely") ("lucky") ("magnificent") ("misty") ("modern") ("motionless") ("muddy") ("mushy") ("mysterious") ("nasty") ("naughty") ("nervous") ("nice") ("nutty") ("obedient") ("obnoxious") ("odd") ("old-fashioned") ("open") ("outrageous") ("outstanding") ("panicky") ("perfect") ("plain") ("pleasant") ("poised") ("poor") ("powerful") ("precious") ("prickly") ("proud") ("putrid") ("puzzled") ("quaint") ("real") ("relieved") ("repulsive") ("rich") ("scary") ("selfish") ("shiny") ("shy") ("silly") ("sleepy") ("smiling") ("smoggy") ("snoring") ("sore") ("sparkling") ("splendid") ("spotless") ("stormy") ("strange") ("stupid") ("successful") ("super") ("talented") ("tame") ("tasty") ("tender") ("tense") ("terrible") ("thankful") ("thoughtful") ("thoughtless") ("tired") ("tough") ("troubled") ("ugliest") ("ugly") ("uninterested") ("unsightly") ("unusual") ("upset") ("uptight") ("vast") ("victorious") ("vivacious") ("wandering") ("weary") ("wicked") ("wide-eyed") ("wild") ("witty") ("worried") ("worrisome") ("wrong") ("zany") ("zealous")))
  "List of general adjectives.")

(add-to-list 'game-master-assistant-places-lists-types :adjective-general)

(defvar game-master-assistant-places-list-noun-place
  (quote (("bar") ("blanket") ("bucket") ("bush") ("cave") ("club") ("field") ("flower") ("forest") ("garden") ("hall") ("hill") ("hole") ("house") ("inn") ("lake") ("lawn") ("ocean") ("pit") ("place") ("plain") ("plant") ("pond") ("pub") ("river") ("road") ("sea") ("sky") ("stream") ("stump") ("tavern") ("trail") ("tree")))
  "List of place (location) nouns.")

(add-to-list 'game-master-assistant-places-lists-types :noun-place)

(defvar game-master-assistant-places-list-noun-animal
  (quote (("alligator") ("ape") ("badger") ("bat") ("bear") ("beaver") ("bee") ("bird") ("boar") ("bull") ("cat") ("chicken") ("chimp") ("clam") ("cod") ("cow") ("crocodile") ("crow") ("cub") ("dog") ("dragon") ("eagle") ("eel") ("elephant") ("ferret") ("fish") ("frog") ("gazelle") ("gorilla") ("hen") ("hawk") ("hippo") ("horse") ("lamb") ("lion") ("lizard") ("monkey") ("mouse") ("owl") ("oyster") ("perch") ("pig") ("pike") ("pony") ("rabbit") ("raccoon") ("rat") ("rhino") ("rooster") ("salmon") ("shark") ("sheep") ("skunk") ("snake") ("squirrel") ("tiger") ("toad") ("trout") ("tuna") ("whale") ("wolverine") ("zebra")))
  "List of animal nouns.")

(add-to-list 'game-master-assistant-places-lists-types :noun-animal)

(defvar game-master-assistant-places-list-adjective-general
  (quote (("annoying") ("anxious") ("arrogant") ("ashamed") ("attractive") ("average") ("awful") ("bad") ("beautiful") ("better") ("bewildered") ("black") ("bloody") ("blue") ("blue-eyed") ("blushing") ("bored") ("brainy") ("brave") ("breakable") ("bright") ("busy") ("calm") ("careful") ("cautious") ("charming") ("cheerful") ("clean") ("clear") ("clever") ("cloudy") ("clumsy") ("colorful") ("combative") ("comfortable") ("concerned") ("condemned") ("confused") ("cooperative") ("courageous") ("crazy") ("creepy") ("crowded") ("cruel") ("curious") ("cute") ("dangerous") ("dark") ("dead") ("defeated") ("defiant") ("delightful") ("depressed") ("determined") ("different") ("difficult") ("disgusted") ("distinct") ("disturbed") ("dizzy") ("doubtful") ("drab") ("dull") ("eager") ("easy") ("elated") ("elegant") ("embarrassed") ("enchanting") ("encouraging") ("energetic") ("enthusiastic") ("envious") ("evil") ("excited") ("expensive") ("exuberant") ("fair") ("faithful") ("famous") ("fancy") ("fantastic") ("fierce") ("filthy") ("fine") ("foolish") ("fragile") ("frail") ("frantic") ("friendly") ("frightened") ("funny") ("gentle") ("gifted") ("glamorous") ("gleaming") ("glorious") ("good") ("gorgeous") ("graceful") ("grieving") ("grotesque") ("grumpy") ("handsome") ("happy") ("healthy") ("helpful") ("helpless") ("hilarious") ("homeless") ("homely") ("horrible") ("hungry") ("hurt") ("ill") ("important") ("impossible") ("inexpensive") ("innocent") ("inquisitive") ("itchy") ("jealous") ("jittery") ("jolly") ("joyous") ("kind") ("lazy") ("light") ("lively") ("lonely") ("long") ("lovely") ("lucky") ("magnificent") ("misty") ("modern") ("motionless") ("muddy") ("mushy") ("mysterious") ("nasty") ("naughty") ("nervous") ("nice") ("nutty") ("obedient") ("obnoxious") ("odd") ("old-fashioned") ("open") ("outrageous") ("outstanding") ("panicky") ("perfect") ("plain") ("pleasant") ("poised") ("poor") ("powerful") ("precious") ("prickly") ("proud") ("putrid") ("puzzled") ("quaint") ("real") ("relieved") ("repulsive") ("rich") ("scary") ("selfish") ("shiny") ("shy") ("silly") ("sleepy") ("smiling") ("smoggy") ("snoring") ("sore") ("sparkling") ("splendid") ("spotless") ("stormy") ("strange") ("stupid") ("successful") ("super") ("talented") ("tame") ("tasty") ("tender") ("tense") ("terrible") ("thankful") ("thoughtful") ("thoughtless") ("tired") ("tough") ("troubled") ("ugliest") ("ugly") ("uninterested") ("unsightly") ("unusual") ("upset") ("uptight") ("vast") ("victorious") ("vivacious") ("wandering") ("weary") ("wicked") ("wide-eyed") ("wild") ("witty") ("worried") ("worrisome") ("wrong") ("zany") ("zealous")))
  "List of general adjectives.")

(add-to-list 'game-master-assistant-places-lists-types :adjective-general)

(defvar game-master-assistant-places-list-viking-town
  (quote (("Almenningar") ("Arnarnes") ("Arnarthufa") ("Austrvegr") ("Axlarhagi") ("Bakkarholt") ("Baro") ("Berg") ("Bergthorshvall") ("Berjadalsa") ("Bildsfell") ("Blanda") ("Blaserkr") ("Blaskogsa") ("Blondukvislir") ("Blundsvatn") ("Boejarsker") ("Bolstaor") ("Boomooshorn") ("Booolfs skytja") ("Borg") ("Botn") ("Bravollr") ("Breioafjoror") ("Breioavao") ("Breiodalr") ("Brunahaugr") ("Bulandshofoi") ("Buoardalr") ("Dalalond") ("Dalsmynni") ("Dimunarvagr") ("Drapuhlio") ("Dufthaksskor") ("Enga") ("Eskifjoror") ("Eyjafjoll") ("Eyjafjollum") ("Eyjardalsa") ("Eyvindara") ("Fagradalsaross") ("Fellsstrond") ("Fjaora") ("Flatatunga") ("Fljotsa") ("Forsfjoror") ("Forsvollr") ("Frooa") ("Gaular") ("Geirmundarstaoir") ("Gilja") ("Gljufra") ("Gnupr") ("Grenitresnes") ("Grimsa") ("Grindaloekr") ("Gufua") ("Gufuskalar") ("Gunnolfsvik") ("Guodalir") ("Hafnarfjall") ("Hafsloekr") ("Hakonarstaoir") ("Hallkelsholar") ("Hallsteinsnes") ("Hamarr") ("Hamarsa") ("Heggsgeroismuli") ("Heinabergsar") ("Helgavatn") ("Hellisdalr") ("Heoinshofoi") ("Hildisey") ("Hisargafl") ("Hjallaland") ("Hjaroarvatn") ("Hlioum") ("Hofsteigr") ("Holmsa") ("Horgsholt") ("Hraun") ("Hraunaheior") ("Hraunsholtsloekr") ("Hreggsgeroismuli") ("Hringariki") ("Hrisateigr") ("Hrutafjaroarstrond in eystri") ("Hundadalr") ("Husavik") ("Hvaleyrr") ("Hvanna") ("Hvarf") ("Hvinisfjoror") ("Hvita") ("Iafjoror") ("Isleifsstaoir") ("Isrooarstaoir") ("Jarolangsstaoir") ("Jokulsfiroir") ("Jorundarholt") ("Josureio") ("Kaldbakr") ("Kaldbaksvik") ("Kalfborgara") ("Kalmanstunga") ("Kambakista") ("Kambsdalr") ("Keldudalr") ("Kelduhverfi") ("Kirkjuboer") ("Kirkjufell") ("Kjallaksholl") ("Knafaholar") ("Knappadalr") ("Kolgrafafjoror") ("Kraeklingahlio") ("Kroksfjaroarnes") ("Kroppr") ("Kylansholmar") ("Landamot") ("Landbrot") ("Langavatnsdalr") ("Laxardalr") ("Ljotarstaoir") ("Lonsheior") ("Loomundarfjoror") ("Maelifellsa") ("Maelifellsdalr") ("Maerin") ("Markarfljot") ("Masstaoir") ("Melar") ("Meoalfell") ("Merrhaefi") ("Miklagil") ("Minthakseyrr") ("Mioskali") ("Mjosyndi") ("Mydalsa") ("Myrar") ("Myrr") ("Narfasker") ("Nattfaravik") ("Naumdaelafylki") ("Norolendingafjoroungr") ("Noromoerr") ("Nororardalr") ("Oddgeirsholar") ("Oddsass") ("Ormsa") ("Oss") ("Papey") ("Papyli") ("Rauoafell it eystra") ("Reykir inir efri") ("Reykjahlio") ("Reykjavellir") ("Rooreksgil") ("Saemundarstaoir") ("Salteyraross") ("Sandbrekka") ("Sanddalr") ("Sandgil") ("Sandloekr") ("Sauoa") ("Seljalandsa") ("Seltjarnarnes") ("Sireksstaoir") ("Skalafell") ("Skalanes") ("Skaldskelmisdalr") ("Skalmarkelda") ("Skarfanes") ("Skeio") ("Skioadalr") ("Skjalfandafljot") ("Skjalgdalsa") ("Skogarstrond") ("Storolfshvall") ("Sumarlioaboer") ("Tungufljot")))
  "List of viking towns.")

(add-to-list 'game-master-assistant-places-lists-types :viking-town)

(defun game-master-assistant-get-places-list (type)
  "Return places list for TYPE.

Where TYPE is one of:

  :adjective-general
  :adjective-town
  :adjective-boat
  :noun-town
  :noun-tavern
  :noun-boat"
  (mapcar #'car (symbol-value
                 (intern
                  (concat "game-master-assistant-places-list-"
                          (substring (format "%s" type) 1))))))

(provide 'game-master-assistant-places-lists)

;;; game-master-assistant-places-lists.el ends here
