#!/bin/bash
             
remind -m -p18 ~/.cal $(date +"%d %b %Y" -d "now") | \
    rem2ps -olrtb 1 -c3 -sthd 5\
           -se 7 -t 0.03 -olr 65\
           -ob 50 -ot 44 -b 3 -l | \
    ps2pdf - ~/.cal/new.pdf
