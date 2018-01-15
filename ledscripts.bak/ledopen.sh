#!/bin/bash

echo 04 >/sys/class/gpio/export #RED
echo 14 >/sys/class/gpio/export #GREEN
echo 02 >/sys/class/gpio/export #BLUE
