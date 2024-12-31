# 容器中运行，用于预处理数据
cd /data_preprocessing/forest
mkdir -p covtype_input covtype_output
cp -n covtype.csv covtype_input/
mahout seqdirectory \
    -i covtype_input \
    -o covtype_output \
    -c UTF-8 \
    -xm sequential \
    --chunkSize 64
