## PWM Wave Player Super Lite for PIC16F1xxx with [Jalv2](http://www.justanotherlanguage.org/downloads)
I came across this page [WAVE PLAYER FOR PIC16F877A.!](https://libstock.mikroe.com/projects/view/120/wave-player-for-pic16f877a) and had a impression for very small code size about 1700 words. But I struggled with the program that aimed to old and paticular MMC FAT16 format in the now, so I rewrite it using Jalv2(Jal) language in order to work with SDSC/SDHC SD card (FAT16/FAT32)from 2GB to 32GB.

### Specification:
1. Supported PICs are 8bit Enhanced Midrange PIC16F1xxx series and PIC18F26J50 etc, as follows:
    - **Programmed by PicKit2/3:**  
        * PIC12F1840    
        * PIC16F1455,PIC16F1459  
        * PIC16F1705,PIC16F1709  
        * PIC16F1825,PIC16F1827,PIC16F1829  
        * PIC16F1938  
        * PIC18F14K50  
        * PIC18F26J50
    - **Programmed by PicKit3 or later:**  
        * PIC16F1619  
        * PIC16F1764  
        * PIC16F18313  
        * PIC16F18325
1. PCM wave music file:  Select 8bit stereo or mono. fs=44.1KHz fixed.
1. Auto play after power on.
1. One push switch controls **Play**,**Pause** and **Next song** operation.
1. Code size is about 1700 words.

### Youtube demo movie:
[![alt_image](https://img.youtube.com/vi/41IuUC8VG0o/0.jpg)](https://www.youtube.com/watch?v=41IuUC8VG0o)

### Schematic:
* Refer to [pin_map.txt](https://github.com/dinau/16f-wave-player-pwm-super-lite-jalv2/blob/main/pin_map.txt) in the archive file.
![img](http://mpu.up.seesaa.net/image/pic16f18313-sd-wave-player_breadborad-2017-2.png)
![img](http://mpu.up.seesaa.net/image/pic16f18313-sd-wave-player_schematic-2017.png)
![img](http://mpu.up.seesaa.net/image/pic16f1827-wav-sd-player-schematic-2017.png)

### Output filter:
* Schematic  
![img](http://mpu.up.seesaa.net/image/pwm-filter-output.png)

### SD Card connection:
* Pin side
    ```
     --------------\
             9     = \    DAT2/NC
                 1 ===|   CS/DAT3    [CS]
                 2 ===|   CMD/DI     [DI]
                 3 ===|   VSS1
     Bottom      4 ===|   VDD
     View        5 ===|   CLK        [CLK]
                 6 ===|   VSS2
                 7 ===|   DO/DAT0    [DO]
             8       =|   DAT1/IRQ
     -----------------
    ```
 * Logo side
    ```
                                             Arduino      NUCLEO-F411       NUCLEO-F030R8
     -----------------
             8       =|   DAT1/IRQ
                 7 ===|   DO/DAT0    [DO]     D12           D12/PA_6           D12/PA_6
                 6 ===|   VSS2
     Top         5 ===|   CLK        [CLK]    D13           D13/PA_5           D13/PA_5
     View        4 ===|   VDD
                 3 ===|   VSS1
                 2 ===|   CMD/DI     [DI]     D11           D11/PA_7           D11/PA_7
                 1 ===|   CS/DAT3    [CS]     D8            D10/PB_6           D10/PB_6
             9     = /    DAT2/NC
     --------------/
    ```

### Pickit2/3 pin map
```
 ------------------
 Pickit2/3 pin map
 ------------------
 -----------
            \
             \
          ==> |1 Vpp/MCLR
              |2 VDD Target
              |3 Vss ground
              |4 ICSPDAT/PGD
              |5 ICSPCLK/PGC
              |6 Aux N.C.
              /
             /
 ------------
```

### Download:
*  Latest version  
[16f-wave-player-pwm-super-lite-jalv2-9.1.zip (2021/12)](https://bitbucket.org/dinau/16f-pwm-wav-sd-card-player/downloads/16f-wave-player-pwm-super-lite-jalv2-9.1.zip)  
If you need to recompile the source code, use this Jalv2 version : [jallib_full-1.6.0.7z](https://bitbucket.org/dinau/16f-pwm-wav-sd-card-player/downloads/jallib_full-1.6.0.7z)

* Old version  
[16f-pwm-wave-player_jalv2_v8.8-2019-02.zip](https://bitbucket.org/dinau/16f-pwm-wav-sd-card-player/downloads/16f-pwm-wave-player_jalv2_v8.8-2019-02.zip)  
[16f-pwm-wave-player_v8.6-2017-02.zip](https://bitbucket.org/dinau/16f-pwm-wav-sd-card-player/downloads/16f-pwm-wave-player_v8.6-2017-02.zip)  
If you need to recompile the source code, use this Jalv2 version : [jallib_full-1.2.0.zip](http://www.justanotherlanguage.org:3389/sites/default/files/ftp_server/builds/old_releases/jallib_full-1.2.0.zip)  

### Write hex file to flash:
* You can find hex files in hex folder,   
for instance,   
sd-wav-player-**16F1705**-v8.8-2019-02.hex  
You can write this file to flash using PicKit2/3 Programmer.  

### Converting to fs=44.1kHz,PCM 8bit stereo or mono data:
* For **8pin** PICs: The .wav files must be converted to 'Mono' data.  
For other PICs:The .waf files must be converted to 'Stereo' data.  
* Use converter tools for example,  
[foobar2000](https://www.foobar2000.org/)  
[Audacity](https://www.audacityteam.org/)  
[SoX](http://sox.sourceforge.net/)  
etc.  

### Supported SD card:
* SDSC/SDHC card, FAT16 and FAT32.  
    1. First, format SD card with [SD Card Formatter](https://www.sdcard.org/downloads/formatter_4/index.html)
    1. Copy PCM wav files to the SD card in root directory.  

### References:
* [Jalv2 mailing list](https://groups.google.com/g/jallist)
* Wave Player Super Lite family  
    * [Nim:   AVR Arduino Uno/Nano version is here. ](https://github.com/dinau/arduino-wave-player-pwm-super-lite-nim)
    * [Nim:   ARM STM32 version is here. ](https://github.com/dinau/stm32-wave-player-pwm-super-lite-nim) 
    * [C/C++:   mbed version is here.](https://os.mbed.com/users/mimi3/code/wave_player_super_lite/) 

