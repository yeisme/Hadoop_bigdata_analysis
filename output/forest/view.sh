# 1. 查看生成的目录结构
hdfs dfs -ls /user/hadoop/input/forest/covtype_vectors

# 2. 查看向量数据
mahout vectordump \
    -i /user/hadoop/input/forest/covtype_vectors/tfidf-vectors \
    -o /tmp/vector_dump.txt \
    -p true \
    -vs 10

# 3. 查看聚类结果
mahout clusterdump \
    -i /user/hadoop/output/forest/clusters/clusters-*-final \
    -o /tmp/cluster_dump.txt \
    -d /user/hadoop/input/forest/covtype_vectors/dictionary.file-0 \
    -dt sequencefile \
    -n 10 \
    -p 10

# 4. 查看结果文件
cat /tmp/vector_dump.txt
cat /tmp/cluster_dump.txt