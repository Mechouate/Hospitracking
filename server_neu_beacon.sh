#!/bin/bash -x

resp=$(ssh pi@192.168.0.10 "bash neu_beacon.sh")
echo $resp
