cd /data_preprocessing/DBLP

mkdir -p dblp_input dblp_output

cp -n DBLP.xml dblp_input/DBLP.xml

# 使用mahout处理XML文档
mahout seqdirectory \
    -i dblp_input \
    -o dblp_output \
    -xm sequential \
    --chunkSize 128 \
    --fileFilterClass org.apache.mahout.text.PrefixAdditionFilter \
    --charset UTF-8
