#!/bin/bash

file_path=$(realpath $0)
dir_path=$(dirname "${file_path}")

# 外部ファイルを実行
${dir_path}/12_01_external.sh

status="${?}"
echo "status: ${status}"

if (("${status}"==4)); then
	echo "読み込み権限がないです"
	exit "${status}"
elif (("$status"==5)); then
	echo "ファイルが存在しません"
	exit "${status}"
fi

#ech "AAA"
if ((${?} != 0));then
	exit 15
fi
echo "BBB"

#exit 0
