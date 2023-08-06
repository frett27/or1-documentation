
Utilisation l'API micropython
-----------------------------

Micropython est un interpreteur python spécialisé pour les petites plateformes, certains points sont à noter sur cette version, si le lecteur est familié avec le développement en python :

- l'allocation de mémoire est réalisé différemment (on ne passe pas par le système, et est alloué dans une arena)
- la bibliothèque de fonction est la même pour le noyau, cependant les modules sont spécifique à micropython (en fonction de la plateforme)


Gestion de l'écran
^^^^^^^^^^^^^^^^^^

Le module python LGVL est intégré à l'interpreteur, il vient avec un grand nombre de fonctionnalités et bibliotheques de widgets, permettant la construction d'écrans.

Création d'un 1er ecran


Utilisation de la manivelle
^^^^^^^^^^^^^^^^^^^^^^^^^^^

Un module `manivelle` permet de se connecter à la manivelle et lire la position absolue de l'axe.
Ci dessous un exemple d'utilisation de cette librairie pour afficher en continue la position de l'axe.

.. code:: python

    import manivelle
    manivelle.init()

    while True:
        print(manivelle.get_pos())




Fonctions de référence de la librairie midiplayer
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Le module midiplayer contient les fonctions nécessaires à l'utilisation de OR1.
il contient les fonctions suivantes :

.. include:: python_api.rst





