
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

Définition d'instrument WAV
============================

Dans la version OR1 , le module


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

