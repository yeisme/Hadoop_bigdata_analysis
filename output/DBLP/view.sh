# 4. 输出结果
hdfs dfs -ls /user/hadoop/output/dblp/fpgrowth

# 5. 查看频繁项集
mahout fpg2itemsets \
    -i /user/hadoop/output/dblp/fpgrowth/frequentpatterns \
    -o /tmp/frequent_itemsets.txt

echo "=== 频繁项集 ==="
cat /tmp/frequent_itemsets.txt
