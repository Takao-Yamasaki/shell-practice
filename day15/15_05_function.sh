#!/bin/bash

# 環境変数の設定
VAR=12

# setの使用
# set -x
# trap

# 関数の定義
function print_hello() {
  echo "Hello"
}

print_goodbye() {
  echo "Good Bye"
}

# 関数の呼び出し
# print_hello
print_goodbye
