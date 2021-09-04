#!/bin/bash

VCI_PATH=$1
UA="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36"
TOKEN="Bearer xxxx"

echo $VCI_PATH
curl -iv -X POST -H "Accept: application/json" -H "User-Agent: ${UA}" -H "Authorization: ${TOKEN}" -F itemType=prop -F file="@${VCI_PATH}" https://api.seed.online/files/user/post-items
