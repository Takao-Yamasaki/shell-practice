#!/bin/bash

# DEBUG
set -x

name="Taro"
age=21

echo "name: ${name}, age: ${age}"
# DEBUGモードの終了
set +x

for i in {0..10}
do
  echo "${i}"
done
