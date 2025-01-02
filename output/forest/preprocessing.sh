# 需要在 Hadoop 集群上运行
# 新版 Mahout 推荐使用 Spark 接口处理数据
# export HADOOP_HEAPSIZE=2048
# export HADOOP_CLIENT_OPTS="-Xmx2048m"

# 1. 首先将 CSV 转换为 SequenceFile 格式
mahout seqdirectory \
    -i /user/hadoop/input/forest/covtype.csv \
    -o /user/hadoop/input/forest/covtype_seq \
    --method text \
    --charset UTF-8 \
    --chunkSize 32 \
    --tempDir /tmp/mahout-tmp \
    -Dmapreduce.map.memory.mb=2048 \
    -Dmapreduce.reduce.memory.mb=2048 \
    -Dmapred.map.tasks=2

# 2. 转换为向量格式
mahout seq2sparse \
    -i /user/hadoop/input/forest/covtype_seq \
    -o /user/hadoop/input/forest/covtype_vectors \
    --namedVector \
    --weight tfidf \
    --overwrite \
    --sequentialAccessVector
