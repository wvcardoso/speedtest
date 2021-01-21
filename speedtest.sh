#!/bin/bash

speedtest --progress=no --format=json | jq . > speed.json

### DATA
t=`cat speed.json | jq .timestamp | tr -d '"'`
data=`date -d $t +'%d-%m-%Y %H:%M:%S'`

### DOWNLOAD
download_bandwidth=`cat speed.json | jq .download.bandwidth`
download=`calc $download_bandwidth/125000`

### UPLOAD
upload_bandwidth=`cat speed.json | jq .upload.bandwidth`
upload=`calc $upload_bandwidth/125000`

### URL
url=`cat speed.json | jq .result.url | tr -d '"' `

### Print
echo Data: $data         >> result.txt
echo Download: $download >> result.txt
echo Upload: $upload     >> result.txt
echo URL: $url           >> result.txt
echo                     >> result.txt