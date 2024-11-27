#!/bin/bash

FILE="apache-mahout-distribution-0.13.0.tar.gz"
URL="https://archive.apache.org/dist/mahout/0.13.0/$FILE"

# 检查文件是否存在
if [ -f "$FILE" ]; then
    echo "$FILE already exists."
else
    echo "Downloading $FILE..."
    curl -O $URL
fi
