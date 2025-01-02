# 设置Hadoop环境变量
# export HADOOP_HEAPSIZE=2048
# export HADOOP_CLIENT_OPTS="-Xmx2048m"

# 1. 将XML文件转换为SequenceFile格式
mahout seqdirectory \
    -i /user/hadoop/input/DBLP/split/DBLP.xml0001 \
    -o /user/hadoop/input/DBLP/DBLP_seq \
    --method text \
    --charset UTF-8 \
    --chunkSize 32 \
    --tempDir /tmp/mahout-tmp \
    -Dmapreduce.map.memory.mb=2048 \
    -Dmapreduce.reduce.memory.mb=2048 \
    -Dmapred.map.tasks=2

# 2. 转换为向量格式
mahout seq2sparse \
    -i /user/hadoop/input/dblp/DBLP_seq \
    -o /user/hadoop/input/dblp/DBLP_vectors \
    --namedVector \
    --weight tfidf \
    --overwrite \
    --sequentialAccessVector
