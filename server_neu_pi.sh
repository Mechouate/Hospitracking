#!/bin/bash -x

neu_pi=$1

mac=$(echo $neu_pi | cut -d"_" -f1)
host=$(echo $neu_pi | cut -d"_" -f2)
ip=$(echo $neu_pi | cut -d"_" -f3)

