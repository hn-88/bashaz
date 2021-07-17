#!/bin/bash
input="./elist.txt"
urlbeg="https://url/to/container/"
urlend="?sp=racwdl&st=2021-06-30T04:56:20Z&se=2021-08-07T12:56:20Z&spr=https&sv=2020-08-04&sr=c&sig=signatureInSAStokenUc%3D"
i=1
for line in $(cat elist.txt)
do
  url="$urlbeg"
  url+="$line"
  url+="$urlend"
  echo "$i. Filename to delete is $line "
  #read -p "Press Enter to continue" < /dev/tty
  /home/mac/Downloads/azcopy rm "$url"
  #echo "$url"
  i=$((i+1))
done

