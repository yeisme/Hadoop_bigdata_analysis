# 将数据拷贝到hadoop容器中
kubectl exec -it hadoop-hadoop-yarn-nm-0 -- mkdir -p /data_preprocessing/forest
kubectl exec -it hadoop-hadoop-yarn-nm-0 -- mkdir -p /data_preprocessing/DBLP

kubectl cp output/forest/covtype.csv hadoop-hadoop-yarn-nm-0:/data_preprocessing/forest/
kubectl cp output/DBLP/DBLP.xml hadoop-hadoop-yarn-nm-0:/data_preprocessing/DBLP/

# 上传
kubectl exec -it hadoop-hadoop-yarn-nm-0 -- mkdir -p /data_preprocessing/DBLP/split
for file in output/DBLP/split/DBLP.xml*; do
    kubectl cp "$file" hadoop-hadoop-yarn-nm-0:/data_preprocessing/DBLP/split/
done
