#!/bin/sh

ps aux | grep ledon | grep /bin/sh | awk '{print $2}' | xargs -I@ kill -9 @

#declaration
#output
out_red=4
out_green=14
out_blue=2
#input
in_red=5
in_green=15
in_blue=6

down_all_led () {
  echo 0 >/sys/class/gpio/gpio$out_red/value #red
  echo 0 >/sys/class/gpio/gpio$out_green/value #green
  echo 0 >/sys/class/gpio/gpio$out_blue/value #green
}

check_red () {
  echo 1 >/sys/class/gpio/gpio$out_red/value #red
  echo 0 >/sys/class/gpio/gpio$out_green/value #green
  echo 0 >/sys/class/gpio/gpio$out_blue/value #green
  cat /sys/class/gpio/gpio$in_red/value
  sleep 1
  down_all_led
  cat /sys/class/gpio/gpio$in_red/value
  sleep 1
}

check_green () {
  echo 0 >/sys/class/gpio/gpio$out_red/value #red
  echo 1 >/sys/class/gpio/gpio$out_green/value #green
  echo 0 >/sys/class/gpio/gpio$out_blue/value #green
  cat /sys/class/gpio/gpio$in_green/value
  sleep 1
  down_all_led
  cat /sys/class/gpio/gpio$in_green/value
  sleep 1
}

check_blue () {
  echo 0 >/sys/class/gpio/gpio$out_red/value #red
  echo 0 >/sys/class/gpio/gpio$out_green/value #green
  echo 1 >/sys/class/gpio/gpio$out_blue/value #green
  cat /sys/class/gpio/gpio$in_blue/value
  sleep 1
  down_all_led
  cat /sys/class/gpio/gpio$in_blue/value
  sleep 1
}


#open port
echo $out_red > /sys/class/gpio/export
echo $out_green > /sys/class/gpio/export
echo $out_blue > /sys/class/gpio/export

echo $in_red > /sys/class/gpio/export
echo $in_green > /sys/class/gpio/export
echo $in_blue > /sys/class/gpio/export


#current set
echo out >/sys/class/gpio/gpio$out_red/direction
echo out >/sys/class/gpio/gpio$out_green/direction
echo out >/sys/class/gpio/gpio$out_blue/direction

echo in >/sys/class/gpio/gpio$in_red/direction
echo in >/sys/class/gpio/gpio$in_green/direction
echo in >/sys/class/gpio/gpio$in_blue/direction

#operate
check_red
check_green
check_blue





#on check
# echo 1 >/sys/class/gpio/gpio$out_red/value #red
# cat /sys/class/gpio/gpio$in_red/value
#
# sleep 0.5
#
# echo 1 >/sys/class/gpio/gpio$out_green/value #green
# cat /sys/class/gpio/gpio$in_green/value
#
# sleep 0.5
#
# echo 1 >/sys/class/gpio/gpio$out_blue/value #blue
# cat /sys/class/gpio/gpio$in_blue/value
#
# sleep 0.5
#
# #off check
# echo 0 >/sys/class/gpio/gpio$out_red/value #red
# cat /sys/class/gpio/gpio$in_red/value
#
# sleep 0.5
#
# echo 0 >/sys/class/gpio/gpio$out_green/value #green
# cat /sys/class/gpio/gpio$in_green/value
#
# sleep 0.5
#
# echo 0 >/sys/class/gpio/gpio$out_blue/value #blue
# cat /sys/class/gpio/gpio$in_blue/value
