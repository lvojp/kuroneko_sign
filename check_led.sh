#!/bin/bash
checknum=15

echo $checknum > /sys/class/gpio/export
echo in > /sys/class/gpio/gpio$checknum/direction
cat /sys/class/gpio/gpio$checknum/value
echo $checknum > /sys/class/gpio/unexport
