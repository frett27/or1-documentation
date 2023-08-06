
Utilisation des API C
---------------------

L'api C propose un accès directe aux fonctionnalités du player, sans interpreteur. Cette librairie est utilisable dans des languages natifs ou autres contexte que le micropython.


libmidiplayer.so.1
^^^^^^^^^^^^^^^^^^

Cette librairie expose les différentes fonctionnalités principales du module.

.. code:: C

    /**
    * init the runtime
    */
    void midiplayerlibcinit()

    /**
    * init the library
    */ 
    int midiplayerlib_init(void)


    // properties
    static const char *LICENSE_PROPERTY = "lic";
    static const char *DISABLE_PERCUSSIONS = "mute_percussions";
    static const char *INTEGRATED_MANIVELLE = "integrated_manivelle";
    static const char *INTEGRATED_MANIVELLE_MODE = "integrated_auto_manivelle";
    static const char *INTEGRATED_MANIVELLE_FACTEUR = "integrated_auto_manivelle_decifacteur";
    static const char *OUTPUT_SERIAL_DEVICE = "output_serial_device";
    static const char *SOUND_PATH_PROPERTY = "sound_path";
    static const char *PLAY_COMMAND_LINE_TEMPLATE = "play_command_line_template";

    int midiplayerlib_defineproperty(const char *property, const char *value)


    /**
    * load a sound bank / instrument
    */
    void *midiplayerlib_loadsoundbank(const char *filename)

    /**
    * encrypt file using the public internal key
    */
    int encrypt_file(const char *filepath)

    /**
    * play file, using it's filename
    */
    int midiplayerlib_play(const char *filename)

    int midiplayerlib_pauseresume(void) // return -1, 0: false, 1:true

    int midiplayerlib_stop(void)

    int midiplayerlib_stopallvoices(void)


    ///////////////////////////////////////////////////////////////

    int midiplayerlib_definesoundbank(const void *soundbank)

    int midiplayerlib_activatebank(const char *bank)

    int midiplayerlib_deactivatebank(const char *bank)

    int midiplayerlib_changetempofactor(const double f)

    int midiplayerlib_changepitchfactor(const double f)

    int midiplayerlib_change_pitch(const int pitch)

    int midiplayerlib_current_pitch(int *pitch)

    float midiplayerlib_play_currentstreamposition()

    float midiplayerlib_play_currentstreamlength()

    int midiplayerlib_isplaying() // 1 true , 0 false

    int midiplayerlib_activatefeature(const char *feature, int activated)



    int midiplayerlib_instrument_count()

    int midiplayerlib_instrument_name(int index, char *buffer, int *maxchars)

    int midiplayerlib_instrument_current(char *buffer, int *maxchars)

    int midiplayerlib_instrument_register_count()

    int midiplayerlib_instrument_register_name(int index, char *buffer, int *maxchars)


    int midiplayerlib_lyrics_simple_get_lamport(int *clock)

    int midiplayerlib_lyrics_simple_get_content(char *buffer, int *maxchar)



    int midiplayerlib_encrypt_file(const char *filename)


    int midiplayerlib_serial(char *outserial, int *outchars, int *valid)


