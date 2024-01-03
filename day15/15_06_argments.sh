#!/bin/bash

function print_something() {
  echo "your argument is : ${1}, ${2}"
  echo "引数の数: ${#}"
  echo "引数の一覧: ${@}"
}

print_something "Apple" "Lemon"

print_something "Grape" "Pine"
