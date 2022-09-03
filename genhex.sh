#!/bin/bash

#--  Copyright (C) 2017, avrin, http://mpu.seesaa.net
#--  This program is licensed under BSD license.
#--  Please refer to "LICENSE.txt".


# 2021/12 v9.1 by avrin
# 2019/02 v8.8 by avrin
# 2016/12 v8.6 by avrin

rev_num=9.1
date=`date +%Y-%m`
rev=v${rev_num}-${date}
log=00build.log

pic_name=(
'dummy'
'12F1840'
'16F1455'
'16F1459'
'16F1619'
'16F1705'
'16F1709'
'16F1764'
'16F18313'
'16F18325'
'16F1825'
'16F1827'
'16F1829'
'16F1938'
'18F14K50'
'18F26J50'
)

# Under construction
other_pic=(
'16F88'
'18F13K50'
)

# https://ytyaru.hatenablog.com/entry/2022/02/18/000000
isExistCmd() { type "$1" > /dev/null 2>&1; }

isRuby=false
isExistCmd ruby && isRuby=true


echo "" > ${log}
# rm -fr hex
  mkdir hex
for (( i = 1; i < ${#pic_name[@]}; ++i ))
do
    touch Makefile
    make device=${pic_name[$i]} >> ${log}
    echo \($i\) make device=${pic_name[$i]}

    mv sd-wav-player-${pic_name[$i]}.hex hex/sd-wav-player-${pic_name[$i]}-${rev}.hex

    if [ ${isRuby} ]; then
      ruby hexdiff.rb hex ${pic_name[$i]}
    fi
done

