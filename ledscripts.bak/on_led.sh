#!/bin/sh

checknum=5 #green watch gpio number
echo $checknum > /sys/class/gpio/export
echo in > /sys/class/gpio/gpio$checknum/direction

# function last () {
# 	# status=$?
# 	echo '終了'
# 	# echo "ステータス: $status"
# 	echo  in trap, status captured
# 	echo $checknum > /sys/class/gpio/unexport
# 	# exit $status
# }
#
# trap 'last'  {1,2,3,15}

# sleep 0.1
echo out >/sys/class/gpio/gpio4/direction
echo out >/sys/class/gpio/gpio14/direction
echo out >/sys/class/gpio/gpio2/direction

while :
do
  #led_on phase
  echo 0 >/sys/class/gpio/gpio4/value #red
  echo 1 >/sys/class/gpio/gpio14/value #green
  echo 0 >/sys/class/gpio/gpio2/value #blue

  sleep 1.0

  cat /sys/class/gpio/gpio$checknum/value

  sleep 1.0

  #led_off phase
  echo 0 >/sys/class/gpio/gpio14/value
  echo 0 >/sys/class/gpio/gpio2/value
  echo 0 >/sys/class/gpio/gpio4/value

  cat /sys/class/gpio/gpio$checknum/value

  sleep 1.0
done


