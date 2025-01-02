# 将数据从 Pod 文件系统复制到 HDFS：

# 使用 hdfs dfs -put 命令将数据上传到 HDFS。建议在 HDFS 上创建一个专门的目录来存放这些数据，例如 /user/hadoop/input（假设你的 HDFS 用户是 hadoop）。

hdfs dfs -mkdir -p /user/hadoop/input/forest
hdfs dfs -mkdir -p /user/hadoop/input/DBLP
hdfs dfs -mkdir -p /user/hadoop/input/DBLP/split

hdfs dfs -put /data_preprocessing/forest/covtype.csv /user/hadoop/input/forest/covtype.csv
hdfs dfs -put /data_preprocessing/DBLP/DBLP.xml /user/hadoop/input/DBLP/DBLP.xml

# -p: 确保父目录存在，如果不存在则创建。
# /user/hadoop/input: 这是 HDFS 上的目录，用于存放输入数据。根据你的 HDFS 配置进行调整。
# /data_preprocessing/forest/covtype.csv: 这是 Pod 内部的文件路径。
# /user/hadoop/input/forest/covtype.csv: 这是 HDFS 上的目标路径。

# 将 /data_preprocessing/DBLP/split/DBLP.xml0001 到 /user/hadoop/input/dblp/split/DBLP.xml0001 的操作类似。
hdfs dfs -put /data_preprocessing/DBLP/split/DBLP.xml0001 /user/hadoop/input/DBLP/split/DBLP.xml0001

# 上传完成后，可以使用 hdfs dfs -ls 命令检查文件是否已经上传到 HDFS
# hdfs dfs -ls /user/hadoop/input
