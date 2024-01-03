#!/bin/bash

# 2 割り込み
trap "echo 'ctrl+c 実行'" 2

# 15 kill停止
trap "echo '停止しました' > tmp.log" 15

# 1 SIGHUP: 端末切断
trap "echo '端末が切断されました' > sighup.log" SUGHUP

sleep 100
