#!/bin/bash
#
# NOTES
#
in_dir="/input/AIRLab/nmt/corpus.crawl/mono/ko/namuwiki/raw/"
file="${in_dir}/namuwiki_20190312.json.out.xml"
lang="ko"
date=`date +"%Y%m%d"`
max_len=400

#python NamuWikiExtractor.py ${file} -q -o - > ${in_dir}/text/namuwiki.mono.${date}.${lang}
python remove_empty_html_line.py -i ${in_dir}/text/namuwiki.mono.${date}.${lang} -o ${in_dir}/text/namuwiki.mono.noempty.${date}.${lang}
    awk -v max_len=${max_len} '{ if (length($0) < max_len) print }' ${in_dir}/text/namuwiki.mono.noempty.${date}.${lang} > ${in_dir}/text/namuwiki.mono.noempty.max${max_len}.${date}.${lang}
