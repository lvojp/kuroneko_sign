#!/bin/sh

# echo 14 >/sys/class/gpio/unexport
# echo 02 >/sys/class/gpio/unexport
# echo 04 >/sys/class/gpio/unexport

# sleep 1

# echo 04 >/sys/class/gpio/export #RED
# echo 14 >/sys/class/gpio/export #GREEN
# echo 02 >/sys/class/gpio/export #BLUE

# sleep 0.1
echo out >/sys/class/gpio/gpio4/direction
echo out >/sys/class/gpio/gpio14/direction
echo out >/sys/class/gpio/gpio2/direction

while :
do
  # echo 0 >/sys/class/gpio/gpio4/value #red
  # echo 0 >/sys/class/gpio/gpio14/value #green
  # echo 0 >/sys/class/gpio/gpio2/value #blue
  # sleep 1.5
  echo 0 >/sys/class/gpio/gpio4/value #red
  echo 1 >/sys/class/gpio/gpio14/value #green
  echo 0 >/sys/class/gpio/gpio2/value #blue
  sleep 1.5
  echo 0 >/sys/class/gpio/gpio14/value
  echo 0 >/sys/class/gpio/gpio2/value
  echo 0 >/sys/class/gpio/gpio4/value
  sleep 0.5
done

# echo 04 >/sys/class/gpio/unexport
# echo 14 >/sys/class/gpio/unexport
# echo 02 >/sys/class/gpio/unexport
