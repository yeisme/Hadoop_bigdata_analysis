# 3. 准备初始聚类中心
mahout kmeans \
    -i /user/hadoop/input/forest/covtype_vectors/tfidf-vectors \
    -o /user/hadoop/output/forest/clusters \
    -k 7 \
    -x 20 \
    --distanceMeasure org.apache.mahout.common.distance.EuclideanDistanceMeasure \
    --convergenceDelta 0.001 \
    --clustering
