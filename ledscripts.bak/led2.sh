#!/bin/sh
echo 14 >/sys/class/gpio/export
echo 02 >/sys/class/gpio/export
echo 04 >/sys/class/gpio/export

sleep 0.1
echo out >/sys/class/gpio/gpio14/direction
echo out >/sys/class/gpio/gpio2/direction
echo out >/sys/class/gpio/gpio4/direction
while :
do
echo 1 >/sys/class/gpio/gpio14/value
echo 1 >/sys/class/gpio/gpio2/value
echo 1 >/sys/class/gpio/gpio4/value
sleep 0.5
echo 0 >/sys/class/gpio/gpio14/value
echo 0 >/sys/class/gpio/gpio2/value
echo 0 >/sys/class/gpio/gpio4/value
sleep 0.5
done

echo 14 >/sys/class/gpio/unexport
echo 02 >/sys/class/gpio/unexport
echo 04 >/sys/class/gpio/unexport
