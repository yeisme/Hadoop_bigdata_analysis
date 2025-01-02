# 检查输入数据
hdfs dfs -ls /user/hadoop/input/dblp/DBLP_vectors/tfidf-vectors

# 3. 运行FP-Growth算法
# 记录开始时间
START_TIME=$(date +%s)

mahout fpg \
    -i /user/hadoop/input/dblp/DBLP_vectors/tfidf-vectors \
    -o /user/hadoop/output/dblp/fpgrowth \
    -k 50 \
    -method mapreduce \
    -s 0.5 \
    -g 50 \
    -useFPG2

# 计算总时间
END_TIME=$(date +%s)
TOTAL_TIME=$((END_TIME - START_TIME))
echo "总运行时间: ${TOTAL_TIME} 秒"
