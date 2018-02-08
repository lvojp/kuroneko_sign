#!/bin/sh

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

down_all_led () {
  echo 0 >/sys/class/gpio/gpio$out_red/value #red
  echo 0 >/sys/class/gpio/gpio$out_green/value #green
  echo 0 >/sys/class/gpio/gpio$out_blue/value #green
}

light_red () {
  echo 1 >/sys/class/gpio/gpio$out_red/value #red
  echo 0 >/sys/class/gpio/gpio$out_green/value #green
  echo 0 >/sys/class/gpio/gpio$out_blue/value #green
}

check_led () {
  cat /sys/class/gpio/gpio$1/value
  # result=`cat /sys/class/gpio/gpio$1/value`
  # echo $result
}

light_green () {
  echo 0 >/sys/class/gpio/gpio$out_red/value #red
  echo 1 >/sys/class/gpio/gpio$out_green/value #green
  echo 0 >/sys/class/gpio/gpio$out_blue/value #green
}

light_blue () {
  echo 0 >/sys/class/gpio/gpio$out_red/value #red
  echo 0 >/sys/class/gpio/gpio$out_green/value #green
  echo 1 >/sys/class/gpio/gpio$out_blue/value #green
}

set_status () {
  echo $1
  echo $1 > ./public/status
}

set_command_status () {
  echo $1
  echo $1 > ./public/command_status
}

set_command_status "集荷あり"
open_port

while :
do
  #lighting
  light_green
  sleep 1
  res=`check_led $in_green`
  if [ $res -eq 1 ]; then
  # if [ $res -eq 0 ]; then
    set_status "ok"
  else
    set_status "ng"
  fi

  #off
  down_all_led
  sleep 1
  res=`check_led $in_green`
  if [ $res -eq 0 ]; then
  # if [ $res -eq 1 ]; then
    set_status "ok"
  else
    set_status "ng"
  fi
done


