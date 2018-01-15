#!/bin/sh
echo 14 >/sys/class/gpio/export
sleep 0.1
echo out >/sys/class/gpio/gpio14/direction
echo 1 >/sys/class/gpio/gpio14/value
# while :
# do
#   echo 1 >/sys/class/gpio/gpio14/value
#   sleep 0.5
#   echo 0 >/sys/class/gpio/gpio14/value
#   sleep 0.5
# done
echo 14 >/sys/class/gpio/unexport
