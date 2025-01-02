# 1. 查看最终聚类中心
mahout clusterdump \
    -i /user/hadoop/output/forest/clusters/clusters-1-final \
    -o /tmp/clusters_dump.txt

# 3. 查看结果
echo "=== 聚类中心 ==="
cat /tmp/clusters_dump.txt
