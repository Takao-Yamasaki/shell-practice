#!/bin/bash

count=0
input_file="input.txt"
sum=0


# ファイルの存在確認
if [[ -f "${input_file}" ]]; then
  if [[ ! -r "${input_file}" ]]; then
    # ファイルが存在するが、読み込み権限がない
    exit 4
  fi
else
  # ファイルが存在しない
  exit 5
fi

while read p
do
  ((count++))
  ((sum += ${p}))
done < "${input_file}"

echo "平均: $(( $sum / $count ))"
