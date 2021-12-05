#
# Makefile script
# For jalv2 Compiler
# avrin, Copyright (c) 2012, 2016, 2017, 2021 all rights reserved.
# 2016/12 Modified for SD card wav player
# 2012/01 Created by avrin.
# This program is released under the BSD license.
#

#device = 12F1840
#device = 16F1455
#device = 16F1459
#device = 16F1619
#device = 16F1705
#device = 16F1709
#device = 16F1764
#device = 16F18313
#device = 16F18325
#device = 16F1825
device = 16F1827
#device = 16F1829
#device = 16F88
#device = 16F1938
#device = 18F13K50
#device = 18F14K50
#device = 18F26J50

rm           = rm -fr
# for windows
#rm          = del /s /q /f


main_name    = main
main_file    = $(main_name).jal
target       = sd-wav-player-$(device)
jal_root     = d:/0pic-data/jalv2-data

jal_sys		 = $(jal_root)/jallib_full-1.6.0

jal_cc       = $(jal_sys)/Compiler/jalv2.exe
jallib_dir   = $(jal_sys)/lib

#asm_list    = -asm $(target).asm  #-codfile $(target).cod
#noreuse      = -no-variable-reuse
fastmath	  = -fastmath
jal_flags   += $(incs)
jal_flags   += -temp-reduce
jal_flags	+= $(noreuse)
jal_flags	+= $(asm_list)
jal_flags	+= $(fastmath)

incs         = -s $(jallib_dir) -s lib -s debug
depends      = config_def.jal            \
			   port_def.jal              \
               wave_player_main.jal      \
			   \
               lib/fat_lib.jal           \
			   lib/power_off_mode.jal    \
               lib/pwm_lib.jal           \
			   lib/register_def.jal      \
               lib/sd_card_local.jal     \
			   lib/timers.jal		     \
			   \
			   debug/debug_info1.jal     \
			   debug/debug_info2.jal     \
               debug/debug_tool.jal      \
			   \
			   Makefile

all: device_sel $(target).hex

device_sel:
	@echo
	echo "include $(device)" > device_select.jal

$(target).hex: $(main_file) $(depends)
	$(jal_cc) $(jal_flags) -hex $@ $(main_file)

.PHONY: clean flash f flash2 f2 flash3 f3

# ------------
# Flash writer setting
# ------------
MPLABX_VER 	  = 5.35

# for Pickit3
flash_writer=C:\MPLABX\v$(MPLABX_VER)\mplab_platform\mplab_ipe\ipecmd.exe
# for Pickit3 alternative
flash_writer3=C:\MPLABX\v$(MPLABX_VER)\mplab_platform\mplab_ipe\pk3cmd.exe
# for Pickit2
flash_writer2 = pk2cmd.exe

f:  flash
f2: flash2
f3: flash3

# for pickit3
flash: all
	$(flash_writer) -TPPK3 -P$(device) -F$(target).hex  -M -OL

# for pickit3 alternative
flash3: all
	$(flash_writer3)        -P$(device) -F$(target).hex  -M -L

# for pickit2
flash2: all
	$(flash_writer2) -P -F$(target).hex  -M -R -Y -J

clean:
	$(rm) $(target).hex $(main_name).asm $(main_name).cod \
		$(main_name).out $(main_name).hex \
		00build.log \
		log.0 log.1 log.2 \
		MPLABXLog.*

