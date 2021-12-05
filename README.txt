----------------------------------------------------------------
For PIC16F enhanced midrange, wave player using pwm with SD card.
     PCM Stereo/Mono,44.1KHz,8bit,
     FAT16/FAT32 support.

This project is licensed under BSD license.
----------------------------------------------------------------

* You can write HEX file to PIC respectively where the files attached in 'hex' directory.

* If you would like to have HEX files to compile from source file,
  use this compiler and libraries.
   jallib-full-1.6.0
   http://justanotherlanguage.org/sites/default/files/ftp_server/builds/release/jallib_full-1.6.0.zip

* Compilation from source code.
 (1) Edit m.bat : Windows batch file.
    Specify properly 'device' and 'compiler_root' variables in the file,
    and execute 'm.bat' on Windows command line console.
 or
 (2) Edit Makefile,
    The variables below must be properly edited as match your environment,
        for example,
        jal_root     = d:/0pic-data/jalv2-data
        jal_sys		 = $(jal_root)/jallib_full-1.6.0
    Specify PIC MCU: Delete '#' from top of the line,for example
        device=16F1827
    and issue the make command on msys2 console or on Windows command line console.

* Schematics
    Provided only two schematics,
        (1) For PIC12F1840 / PIC16F18313 refer to
            doc/pic16f18313-sd-wave-player_schematic-2017.png
            doc/pic16f18313-sd-wave-player_breadborad-2017.png
        (2) For PIC18F1827 refer to
            doc/PIC16F1827-wav-sd-player-schematic-2017.png
    Other schematics are abbreviated, but please refer to 'pin_map.txt' for other PICs.
    You could wire other wave players by referencing the diagrams in 'pin_map.txt'.

* Other information
    Web page: Local language only at this moment.
        http://mpu.seesaa.net/article/445037481.html


History
-------
v9.1: 2021/11 by avrin: Just maintenance release so far.
v9.0: 2019/11 by avrin:
                  * Fixed compilation error of pic16f1455 due to undefinition for 'pin_A1_direction'.
                  * fat_lib.jal: Changed some variable names and reduced some SRAMs.
v8.9: 2019/10 by avrin: Modified PPS setting with jallib_full-1.4.0 or jallib_full-1.3.0.
v8.8: 2019/02 by arvrn: Simplified source code.
v8.6: 2017/02 by avrin: First release.

