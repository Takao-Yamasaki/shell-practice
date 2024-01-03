#!/bin/bash

path=$(realpath ${0})
basedir=$(dirname ${path})

# ライブラリの呼び出し
source $basedir/libraries/calculation.sh

# 合計値の計算
calculation:sum "${@}"

# 平均値の計算
calculation::avg "${@}"
