#!/bin/bash

if [ -x "$(command -v 7z)" ]; then
    echo "7z 已安装"
    # 解压数据集
    poetry run python -m datasets.extract

else
    if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
        echo "7z 未安装，请下载 https://www.7-zip.org/a/7z2409-x64.msi"
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        echo "7z 未安装，正在使用 apt 安装..."
        sudo apt update
        sudo apt install -y p7zip-full
    else
        echo "不支持的操作系统，请手动安装 7z"
    fi
fi
