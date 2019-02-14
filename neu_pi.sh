#!/bin/bash -x

pi_mac=$(ifconfig | grep 'b8:27:eb'| awk '{print $2}'| sed -n 1p)"_"$(hostname)"_"$(hosptname -I)

ssh pi@192.168.0.112 "bash pi_mac.sh $pi_mac"