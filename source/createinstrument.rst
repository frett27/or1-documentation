
==============================================
Paramétrage des sons et création d'instruments
==============================================

Le module OR1 permet la définition d'instrument qui pourront être lus et sélectionnés dans le module. 
De base, le module OR1 effectue une restitution basée sur des fichiers WAV qui sont mélangés en fonction de la note demandée. Chaque note est associés à un son qui sera joué.


Organisation des instruments
============================

Le module gère plusieurs instrument en même temps, ceci permet de pouvoir facilement et rapidement passer d'un instrument à un autre. Une répertoire est donc mis en place pour héberger tous les instruments utilisables par le module.

::

        ├── Instrument-Anche
        │   └── Standard+Orch
        └── Instrument-Flute
            └── Standard+Orch

Ce répertoire, analysé au démarrage de l'application, doit contenir des fichiers descripteurs pour informer du format de l'instrument ainsi que les éléments associés (fichier wav, registres ,  ..)

Chaque instrument a sa description stockée dans le fichier YAML : MANIFEST.yml

Définition d'instrument avec le synthétiseur OR1
================================================

Dans la version OR1 , le module utilise des fichiers WAV pour la restitution des sons. Chaque fichier WAV est associé à une note. Le nom du fichier WAV est composé de la note et de l'octave. Par exemple, le fichier "Anche_0.WAV" est associé à la note 0 et au registre "Anche".

Le synthetiseur nécessite également un fichier de description de l'instrument. Ce fichier est au format YAML et doit être nommé "MANIFEST.yml". Ce fichier contient les informations suivantes :

"name" : nom de l'instrument
"registers" : liste des registres additionels
"percussions" : répertoire contenant les fichiers WAV des percussions (canal 10 en Midi), en respectant l'ordre GM (general Midi pour la spécification des percussions)


exemple de fichier MANIFEST.yml
::

        instrument:
          name: "Instrument Generique Anche et registre Flutes"
          registers: ["Flute", "Anche"]
          percussions: "Standard+Orch"

Dans cet exemple ci dessus, l'instrument est nommé avec la balise "name", ce nom est celui présenté à l'API et dans l'application. la balise "registers" indique les registres additionels pouvant être activés avec cet instrument.

On retrouve à l'intérieur du répertoire, les fichiers sonores associés.
Les fichiers wav sont des fichiers non compressés, stéréos, et encodés en 16bits signés.

exemple de contenu d'un instrument : ::

    Instrument1/
    ├── MANIFEST.yaml
    ├── Anche_0.WAV
    ├── Anche_100.WAV
    ├── Anche_101.WAV
    ├── Anche_37.WAV
    ...
    ├── Anche_38.WAV
    ├── Anche_39.WAV
    ├── Anche_3.WAV
    ├── Anche_9.WAV
    ├── DEFAULT_0.WAV
    ...
    ├── DEFAULT_100.WAV
    ├── DEFAULT_99.WAV
    ├── DEFAULT_9.WAV
    ├── Flute_48.WAV
    ...
    ├── Flute_49.WAV
    ├── Flute_84.WAV
    ├── Flute_85.WAV
    ├── Flute_86.WAV
    ├── Flute_87.WAV


Extension de définition pour la lecture des fichiers BOOK
==========================================================

Les fichier book, sont des fichiers XML contenant la description d'un carton. Dans le fichier book, on retrouve la description de l'instrument utilisé pour la lecture du carton. 
Il faut donc ajouter à la définition de l'instrument, pour chaque piste, la note midi utilisée pour la restitution sonore.

cette possibilité est réalisée par le champ "midimapping", comme suit :
::

  instrument:
    type: "MIDI"
    name: "Flutes2"
    registers: []
    midimapping:
      0: [0, 57]
      1: [0, 48]
      2: [0, 50]
      3: [0, 53]
      4: [0, 55]
      5: [0, 60]
      6: [0, 62]
      7: [0, 64]
      8: [0, 65]
      9: [0, 66]
      10: [0, 67]
      11: [0, 69]
      12: [0, 70]
      13: [0, 71]
      14: [0, 72]
      15: [0, 73]
      16: [0, 74]
      17: [0, 75]
      18: [0, 76]
      19: [0, 77]
      20: [0, 78]
      21: [0, 79]
      22: [0, 80]
      23: [0, 81]
      24: [0, 82]
      25: [0, 83]
      26: [0, 84]
      27: [0, 86]
      28: [0, 68]

Dans cet exemple, on retrouve la définition de l'instrument "Flutes2" qui est de type "MIDI". Le champ "midimapping" contient la liste des canaux et notes midi à utilisées pour la restitution sonore, pour chaque piste (ici la définition d'un carton 29t est utilisée).



Description des instruments utilisant des soundfont sf2
=======================================================

Le module logiciel OR2 permet l'utilisation de bank de sons soundfont. https://fr.wikipedia.org/wiki/SoundFont 
Ce sont des ficheirs sf2 permettant l'encodage de sons d'instrument et éditables avec le logiciel polyphone https://www.polyphone-soundfonts.com/ 

La définition d'un instrument utilisant cette définition contient des configuration associée dans le fichier MANIFEST.yml

exemple de définition :
::
  instrument:
    type: "Synth"
    name: "B"
    registers: ["DEFAULT"]
  sf2: "/usr/share/sounds/sf2/default-GM.sf2"
  sf2registers:	
    - channel: 0
      banknum: 0
      presetnum: 22
      register: "DEFAULT"

Le répertoire ne contient pas de fichier wav, mais un fichier sf2 référencé. Pour chaque registre, un champ banknum et preset indique le numéro de la banque et du preset à utiliser pour la restitution du son. Le champ register indique le registre associé à ce son.
