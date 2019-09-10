#!/bin/bash
#
# NOTES
#
if [ "$#" -eq 0 ]; then
    echo "usage: batch.sh [\"input_folder\"] [\"en|ko\"]"
    echo "example: batch.sh input_folder en"
    exit;
fi


in_dir=$1
lang=$2

if [[ ! -d "${in_dir}/text" ]]; then
    mkdir "${in_dir}/text"
fi

num=1
prefix=""
lang="en"
date=`date +"%Y%m%d"`

for file in `ls ${in_dir}/*xml*`
do
	if [[ ${num} -lt 10 ]]; then
		prefix="0"
	fi
    bname=`basename ${file}`
	python WikiExtractor.py ${file} -q -o - > ${in_dir}/text/wiki.mono.${date}.${prefix}${num}.${lang}
	num=$((num + 1))
done
