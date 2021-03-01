#!/bin/bash

while [ true ]
do
  echo "HEllo world"
  sleep 2
  d=`date`
  echo  "time is  $d"
  sleep 3
  echo  "THis is container process ..."
  sleep 2
done