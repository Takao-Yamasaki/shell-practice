#/bin/bash

# cat data.csv
# cat /home/ec2-user/day12/project/bin/data.csv

# 相対パスでの指定
# cat ../data/name.csv
# cat /home/ec2-user/day12/project/data/name.csv

# $0: 現在実行しているシェル
# シェルの絶対パスを取得
full_path=$(realpath ${0})
#echo ${0}
#echo ${full_path}

bin_path=$(dirname "${full_path}")
# echo ${bin_path}

project_path=$(dirname "${bin_path}")
data_path="${project_path}/data"
# echo ${data_path}

cat "${bin_path}/data.csv"
cat "${data_path}/name.csv"
