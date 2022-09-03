#!/bin/ruby
#--  Copyright (C) 2017, avrin, http://mpu.seesaa.net
#--  This program is licensed under BSD license.
#--  Please refer to "LICENSE.txt".

# 2022/09  Converted to Ruby script from Bash script.
# 2021/12 v9.1 by avrin
# 2019/02 v8.8 by avrin
# 2016/12 v8.6 by avrin
#
# Generate all hex files at a time.
# Usage:
#   $ ruby genhex.rb
#

REV_NUM = "9.1"

tm = Time.now
sDate = tm.year.to_s + "-" + sprintf("%02d",tm.month)
rev = "v" + REV_NUM + "-" + sDate
logname = "00build.log"
hexDir = "hex"

picTbl = [
"12F1840",
"16F1455",
"16F1459",
"16F1619",
"16F1705",
"16F1709",
"16F1764",
"16F18313",
"16F18325",
"16F1825",
"16F1827",
"16F1829",
"16F1938",
"18F14K50",
"18F26J50"
]
# Under construction
other_pic=[ "16F88","18F13K50" ]

sCmd = " echo logStart  > #{logname}"
system(sCmd)
begin
  Dir.mkdir(hexDir)
rescue => e
end

picTbl.each_with_index do | picname,num |
  sCmd = "touch Makefile"
  system(sCmd)
  puts sprintf("[%2d] make device=%s",num+1,picname)
  STDOUT.flush
  sCmd = "make device=#{picname} >> #{logname}"
  system(sCmd)
  sCmd = "mv sd-wav-player-#{picname}.hex hex/sd-wav-player-#{picname}-#{rev}.hex"
  system(sCmd)

  # Do diff with previous hex file
  Array hexFiles = []
  Dir.glob(hexDir + "/*.hex").each do | fname |
    if fname =~/#{picname}/
      hexFiles << fname
    end
  end
  case  hexFiles.size
    when 2
      sCmd = "diff -q " + hexFiles[0] + " " + hexFiles[1]
      system(sCmd)
    else
      puts "ERROR:: Many hex files exist !!!!!!!!!!!"
      exit 1
    end
  #
  puts ""
end

