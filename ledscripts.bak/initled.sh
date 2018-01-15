#!/bin/bash

prNum=`ps aux | grep ledon | grep /bin/sh | awk '{print $2}'`

if [ -n "$prNum" ]; then
  echo $prNum
  kill -9 $prNum
fi

