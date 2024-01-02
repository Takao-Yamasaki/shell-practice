#!/bin/bash

# 2024年  1月  2日 火曜日 10:33:29 UTC
# touch -d "2024/01/02" file1.txt
# touch -d "2023/12/26" file2.txt
# touch -d "2023/12/19" file3.txt
# touch -d "2023/12/12" file4.txt
# touch -d "2023/12/04" file5.txt
# touch -d "2023/12/02" file6.txt

find . -mtime +30 -name "*txt" | xargs rm
