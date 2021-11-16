#!/bin/bash

redColour="\e[0;31m\033[1m"
endColour="\033[0m\e[0m"

red=$1
firstport=10
lastport=500

if [ "$1" == "" ]; then
  echo -e "\n${redColour} Usage: ./tarea.sh <primeros 3 octetos de la ip>\n${endColour}"
  echo -e "${redColour} Example: ./tarea.sh 192.168.1\n${endColour}"
  exit
fi

function port_scan { 
  for ((counter=$firstport; counter<=$lastport; counter++)) 
  do 
    (echo >/dev/tcp/$1/$counter) > /dev/null 2>&1 && echo "$counter open" >> output.txt
  done 
} 

function os_detect() {
  if type -t wevtutil &> /dev/null 
  then 
      OS=MSWin 
  elif type -t scutil &> /dev/null 
  then 
      OS=macOS 
  else 
      OS=Linux 
  fi 
  echo $OS > output.txt
}

function is_alive_ping() { 
  ping -c 1 $1 > /dev/null 2>&1 
  if [[ $? -eq 0 ]]; then
    echo "Node with IP: $i is up." >> output.txt
    port_scan $1
  fi
} 

function send_ip() {
  for i in $red.{1..255} 
  do 
    is_alive_ping $i &
  done 
}

os_detect
send_ip
