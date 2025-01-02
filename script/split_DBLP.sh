# 创建目标目录
mkdir -p output/DBLP/split

# 切分DBLP数据集为200M的文件，使用数字后缀
split -b 200M --numeric-suffixes=1 --suffix-length=4 output/DBLP/DBLP.xml output/DBLP/split/DBLP.xml
