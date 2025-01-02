# 检查输入数据
hdfs dfs -ls /user/hadoop/input/forest/covtype_vectors/tfidf-vectors

# 3. kmeans命令
# 记录开始时间
START_TIME=$(date +%s)

# kmeans命令
mahout kmeans \
    -i /user/hadoop/input/forest/covtype_vectors/tf-vectors \
    -o /user/hadoop/output/forest/clusters \
    -c /user/hadoop/output/forest/clusters-0 \
    -k 7 \
    -dm org.apache.mahout.common.distance.EuclideanDistanceMeasure \
    -cd 0.001 \
    -xm mapreduce \
    -x 20 \
    -ow \
    -cl

# 计算总时间
END_TIME=$(date +%s)
TOTAL_TIME=$((END_TIME - START_TIME))
echo "总运行时间: ${TOTAL_TIME} 秒"

# 4. 输出结果
hdfs dfs -ls /user/hadoop/output/forest/clusters
