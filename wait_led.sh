#!/bin/sh

ps aux | grep on_led | grep /bin/sh | awk '{print $2}' | xargs -I@ kill -9 @

#declaration
#output
out_red=4
out_green=14
out_blue=2
#input
in_red=5
in_green=15
in_blue=6

open_port () {
  #open port
  echo $out_red > /sys/class/gpio/export
  echo $out_green > /sys/class/gpio/export
  echo $out_blue > /sys/class/gpio/export

  echo $in_red > /sys/class/gpio/export
  echo $in_green > /sys/class/gpio/export
  echo $in_blue > /sys/class/gpio/export
}

set_current () {
  #current set
  echo out >/sys/class/gpio/gpio$out_red/direction
  echo out >/sys/class/gpio/gpio$out_green/direction
  echo out >/sys/class/gpio/gpio$out_blue/direction

  echo in >/sys/class/gpio/gpio$in_red/direction
  echo in >/sys/class/gpio/gpio$in_green/direction
  echo in >/sys/class/gpio/gpio$in_blue/direction
}

light_yellow () {
  echo 0 >/sys/class/gpio/gpio$out_red/value #red
  echo 1 >/sys/class/gpio/gpio$out_green/value #green
  echo 1 >/sys/class/gpio/gpio$out_blue/value #green
}

check_led () {
  cat /sys/class/gpio/gpio$1/value
}

set_status () {
  echo $1
  echo $1 > ./public/status
}

set_command_status () {
  echo $1
  echo $1 > ./public/command_status
}

set_command_status "集荷なし"

open_port
set_current
light_yellow

res=`check_led $in_green`
if [ $res -eq 1 ]; then
  set_status "ok"
else
  set_status "ng"
fi

