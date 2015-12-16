#!/bin/bash

start="2012-01-01"
end=$(date +%F)

difference=$(( $(date +%s -d ${end}) - $(date +%s -d ${start}) ))
difference=$(echo ${difference} | awk '{print int($1/(2592000))}')
             
cat ~/.cal/old/todo* ~/.cal/old/timer* \
    ~/.cal/old/somedate* ~/.cal/old/mail2rem* | \
    sort | uniq | sed -n '/^REM/p' | \
    remind -m -p${difference} - $(date +"%d %b %Y" -d ${start}) | \
    rem2ps -c3 -sthd 4\
           -se 5 -t 0.03 -olr 65\
           -ob 50 -ot 44 -b 3 -l | \
    ps2pdf - ~/.cal/old.pdf
