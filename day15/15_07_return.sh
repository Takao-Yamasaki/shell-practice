#!/bin/bash

function sum() {
  retval=0
  for num in "${@}"
  do
    (( retval+=${num} ))
  done
  # echo "${retval}"
  return ${retval}
}

sum 1 2 3 4

# 返り値を取得
value=${?}
echo "返り値は、${value}です"
