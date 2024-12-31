

# 初始化
init:
	sh script/init_project.sh

# 解压
unzip:
	sh script/unzip.sh

# k8s部署
deploy:
	sh script/start_hadoop_service.sh

# 数据预处理
data_preprocessing:
	sh script/data_preprocessing.sh
