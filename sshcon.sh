#!/bin/bash
# Alexey Merkulov 03/2021
user=root
pwd=password
prefix=192.168
if [ ! -e /bin/sshpass ]; then
  echo 'Error! Need install sshpass. Use:'
  echo '  sudo apt install sshpass'
  exit
fi
echo
if [ $# == 0 ]; then
  echo 'This script allows fast connect by ssh. Use:'
  echo "  $0 5"
  echo "for connect to $prefix.2.5. OR:"
  echo "  $0 3 5"
  echo "for connect to $prefix.3.5."
  echo 'You can set user name and password inside.'
  echo
  exit
elif [ $# == 1 ]; then
  ip="$prefix.2.$1"
  echo
  echo "connecting to $ip"
elif [ $# == 2 ]; then
  ip="$prefix.$1.$2"
  echo
  echo "connecting to $ip"
else
  echo
  echo 'Error! Too many arguments.'
  exit
fi
echo
sshpass -p "$pwd" ssh "$user"@"$ip"
if [ $? != 0 ]; then
  echo 'Please, accept fingerprint and repeat. Use:'
  echo "  ssh $user@$ip"
fi
