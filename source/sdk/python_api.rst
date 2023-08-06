

Fonctions d'initialisation de la bibliothèque
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code:: python


    """
    Module contenant les fonctionnalités du module OR1
    """

    def init():
        """
            initialise la librairie midiplayer
        """
        pass

        
    def feature_set(feature_name, feature_value):
    """
        définit la valeur d'une feature
    """
        pass

    def property_set(property_name, property_value):
    """
        définit la valeur d'une propriété de paramétrage
    """
        pass


L'initialisation de la librairie est nécessaire au démarrage, pour pouvoir utiliser les fonctions associée. 

Fonctions d'utilisation des instruments
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Les fonction ci dessous proposent une gestion des bank de sons et instruments.

.. code:: python

    def loadsoundbank(filename):
        """
            charge une bank de sons, filename contient le nom de l'instrument
            cette fonction monte en mémoire la connaissance de la bank de son
            pour l'utiliser dans le module il est nécessaire d'utiliser "definesoundbank"
        """
        pass*



    def definesoundbank():
        """
            applique la bank de sons chargée précédemment
        """
        pass


    def activebank(bank):
    """
    active le jeu de registre "bank"

    @exception  une exception est levée en cas d'erreur
    """
        pass

    def deactivatebank():
    """
    desactive le jeu de registre "bank"

    @exception  une exception est levée en cas d'erreur
    """
        pass

    def instruments():
    """
        @return retourne une liste de noms d'instrument disponibles pour le jeu
    """
        pass

    def get_current_instrument_registers():
    """
        pour l'instrument en cours, donne la liste des registres
    """
        pass

    def current_instrument_name():
    """
        donne le nom de l'instrument actif actuellement
    """
        pass


Gestion du jeu du fichier, et interaction avec le player
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Une fois initialisée, le player peut être piloté avec les quelques fonctions proposées ci dessous.


.. code:: python

    def play(filename):
    """
        Démarrage du jeu en lisant le fichier dont le nom est passé en paramètres

        @exception une exception est retournée en cas d'erreur (lecture de fichier)
    
    """
        pass

    def stop():
    """
        Arrête le player et le jeu du fichier courant
    """
        pass


    def isplaying():
    """
    
        @return un booleen indiquant si le player est en cours de jeu
    """
        pass

    def pauseresume():
    """
        effectue une pause / reprise du jeu en cours
    """
        pass


Ci dessous les fonctions permettant d'interragir avec le player, et le jeu. On retourne un nombre de fonction permettant de savoir où en est le jeu. 

.. code:: python


   def playstreamlength():
    """
        retourne la longueur du fichier en cours de jeu
    """
        pass

    def playstreamposition():
    """
        retourne la position actuelle de jeu dans le fichier
    """
        pass


.. code:: python


    def changetempofactor(tempofactor):
    """
    change le tempo de jeu
    @param tempofactor : un nombre définissant le facteur de temp (1.0 -> vitesse originale, 0.5 -> vitesse doublée)
    """
        pass


    def change_pitch(pitch_int):
    """
    @param pitch_int
        nombre de demi ton pour la transposition
        (ce nombre peut être négatif)
    """

        pass

    
    def current_pitch():
    """
    @return integer 
        retourne le pitch positionné
    """
    
        pass


    def stopallvoices():
    """
        arrete le jeu de toutes les voix (faire silence)
        en cas de mise en pause du player, certaines voix peuvent
        rester active.
        Cette fonction permet d'arreter les voix en cours
    """
        pass

    def lyrics_clock():
    """
        @return retourne l'horloge de changement associée aux paroles.
        lorsque les paroles change (associée au morceau), 
        le nombre detrourné est 
    """
        pass

    def lyrics_current():
    """
        @return recupère les paroles affichée en ce moment
    """
        pass


Encryption
~~~~~~~~~~

.. code:: python

    def encrypt(filename):
    """
        encrypte le fichier donné en paramètre, en utilisant la clef cryptée
    """
        pass


Gestion de l'autorisation et de la license
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code:: python        

    def license_serial():
    """
        retourne l'identifiant de license
    """
        pass

    def license_query():
    """
        retourne l'état d'autorisation de la license, pour pouvoir utiliser les fonctions
    """
        pass

