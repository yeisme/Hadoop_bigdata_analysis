
.PHONY: 1node 3node uninstall

default: help

help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  1node       Install Hadoop with 1 node"
	@echo "  3node       Install Hadoop with 3 nodes"
	@echo "  uninstall   Uninstall Hadoop"
	@echo "  port-forward   Port forward to Hadoop Web UIs"
	@echo "  mahout      Build Mahout Docker image"
	@echo "  down        Download Hadoop and Mahout tarballs"
	@echo "  helm-repo   Add Hadoop Helm repo"

1node:
	helm install hadoop pfisterer-hadoop/hadoop -f ./value-1node.yaml

3node:
	helm install hadoop pfisterer-hadoop/hadoop -f ./value-3node.yaml

uninstall:
	helm uninstall hadoop

port-forward:
	# NameNode Web UI
	kubectl port-forward svc/hadoop-hadoop-hdfs-nn 9870:9870 &
	# ResourceManager Web UI
	kubectl port-forward svc/hadoop-hadoop-yarn-rm 8088:8088 &
	# Wait for all port-forwards to be established

mahout: down
	docker build -t yeisme0123/hadoop-mahout:latest .

down:
	sh ./download.sh

# 安装 helm repo
helm-repo:
	helm repo add pfisterer-hadoop https://pfisterer.github.io/apache-hadoop-helm/
	helm repo update
