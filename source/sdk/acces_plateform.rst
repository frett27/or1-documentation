
========================================
Accès en Developpement sur la plateforme
========================================

Le développement peut être réalisé : à partir de la carte SD, ou à partir du reseau (pour les boucles à retours rapides).

La carte SD est formattée au format ext4, et peut être ouverte à partir de différents systèmes.

Un accès via SSH est également disponible, si le module est connecté à un reseau local. 

Le programme est installé à la racine du système dans `/orgue` qui contient :

- les différents éxécutables
- le répertoire de sons et de définition des instruments (voir :doc:`../createinstrument.rst`)

Des scripts shell permettent de lancer micropython, avec l'accès aux différents librairies dynamiques (.so).

