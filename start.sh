#! /bin/env bash

os_options=(manjaro)
read -p "Enter your OS from the list (${os_options[@]}): " -r OS_TYPE

if [[ $OS_TYPE = "manjaro" ]]
then
  echo "OK"
else
  echo "There's no config for this OS."
fi