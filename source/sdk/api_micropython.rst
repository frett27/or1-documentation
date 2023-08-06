
Utilisation l'API micropython
-----------------------------

Micropython est un interpreteur python spécialisé pour les petites plateformes, certains points sont à noter sur cette version, si le lecteur est familié avec le développement en python :

- l'allocation de mémoire est réalisé différemment (on ne passe pas par le système, et est alloué dans une arena)
- la bibliothèque de fonction est la même pour le noyau, cependant les modules sont spécifique à micropython (en fonction de la plateforme)

La documentation complète du language est disponible sur internet à cette adresse : https://docs.micropython.org/en/latest/



Gestion de l'écran
^^^^^^^^^^^^^^^^^^

Le module python LGVL est intégré à l'interpreteur, il vient avec un grand nombre de fonctionnalités et bibliotheques de widgets, permettant la construction d'écrans.

La documentation complète de la librairie LGVL est disponible sur internet à cette adresse : https://docs.lvgl.io/latest/en/html/index.html

La librairie est accessible via le module `lvgl`, il est possible de l'importer dans un script python et l'initialiser pour le module OR1, avec le script suivant :


.. code:: python


    import usys as sys
    sys.path.append('') # See: https://github.com/micropython/micropython/issues/6419
    
    import lvgl as lv
    lv.init()
    
    import fb # Frame buffer driver

    disp_buf1 = lv.disp_draw_buf_t()
    buf1_1 = bytearray(WIDTH_SCREEN*10)
    buf1_2 = bytearray(WIDTH_SCREEN*10)
    disp_buf1.init(buf1_1, buf1_2, len(buf1_1)//4)
    disp_drv = lv.disp_drv_t()
    disp_drv.init()
    disp_drv.draw_buf = disp_buf1
    disp_drv.flush_cb = conf.cb
    disp_drv.hor_res = WIDTH_SCREEN
    disp_drv.ver_res = HEIGHT_SCREEN

    disp = disp_drv.register() # Register the driver and save the created display object
   
    import ev # Event interface (touchpad, encoder, keyboard, mouse)

    fb.init() # Initialize the frame buffer device
    ev.init() # Initialize the input device driver

    def timercb(timer): # Timer callback
        lv.tick_inc(5)
        lv.task_handler()

    player_state_task = lv.timer_create(timercb, 20, None) # every 20ms

    
    if __name__ == '__main__':
        while True:
            utime.sleep(1)




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





