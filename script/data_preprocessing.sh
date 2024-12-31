# 启动一个容器用于数据预处理
# output/目录挂载到容器中的 /data_preprocessing/目录下
docker run -it --rm \
    -v "$(pwd)/output:/data_preprocessing" \
    yeisme0123/hadoop-mahout:latest \
    bash


# 进入容器后运行，
bash /data_preprocessing/forest/preprocessing.sh
bash /data_preprocessing/DBLP/preprocessing.sh
