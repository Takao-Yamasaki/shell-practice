#!/bin/bash

trap "remove_files" 1 2 15

function remove_files(){
  # 現在のディレクトリ内にあるtmpで始まるファイルを削除
  rm ./tmp_*
  # シェルスクリプトを終了
  exit
}

for i in {0..100}
do
  echo "${i}" > tmp_${i}.log
  sleep 1
done
