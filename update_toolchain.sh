#!/bin/bash

cd `dirname $0`

echo "updating git repository"
git pull -r origin master

if [[ 2 -ne $# ]]
then
  echo "script requires exactly 2 parameters"
  echo "1: version name according on the folder [atom/linux64]"
  echo "2: local target toolchain name [qitoolchain list for more info]"
  exit
fi

if [[ "atom" = "$1" ]]
then
  echo "will install atom version"
  local_package=atom/toolchain_install_atom.zip
elif [[ "linux64" = "$1" ]]
then
  echo "will install linux64 version"
  local_package=linux64/toolchain_install_linux64.zip
elif [[ "local_ros" = "$1" ]]
then
  echo "will install local_ros version"
    local_package=local_ros/toolchain_install_local_ros.zip
else
  echo "no valid version found in second parameter, must be either atom, linux64 or local_ros"
  exit
fi

echo "checking if ros is already in the local toolchain"

qitoolchain info $2 | grep "/ros"
if [ "$?" -eq "0" ]; then
  echo "qitoolchain remove-package -c $2 ros"
  qitoolchain remove-package -c $2 ros
fi
#qitoolchain remove-package -c $2 ros


echo "qitoolchain add-package -c $2 $local_package"
qitoolchain add-package -c $2 $local_package
