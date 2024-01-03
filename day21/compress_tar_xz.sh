#!/bin/bash

# awk "BEGIN {for(i=0;i<=1000;i++) print \"Number \" i}" > output1.txt
# awk "BEGIN {for(i=0;i<=1000;i++) print \"Number \" i}" > output2.txt
# du -sh ./*

find ./ -size +1k | xargs -I @ tar -cJf @.tar.xz @
