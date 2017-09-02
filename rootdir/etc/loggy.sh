#!/bin/sh
# loggy.sh.

date=`date +%F_%H-%M-%S`
logcat -v time -f  /cache/los15logcat_${date}.txt
