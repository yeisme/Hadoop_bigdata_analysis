
.PHONY: 1node 3node uninstall

default: help

help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  1node       Install Hadoop with 1 node"
	@echo "  3node       Install Hadoop with 3 nodes"
	@echo "  uninstall   Uninstall Hadoop"

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
