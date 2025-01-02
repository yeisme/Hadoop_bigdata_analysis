# Hadoop_bigdata_analysis

## 项目介绍

本项目为 GZHU 电信学院22级学生大数据期末作业

题目要求：Hadoop是Google的云计算技术的开源实现，Mahout是Hadoop中关于分布式大数据分析的一个模块。

- 利用Hadoop中的Mahout搭建分布式大数据分析平台，该平台中至少有3个以上客户端，并完成以下3个任务：
- 针对DBLP数据集(<https://dblp.uni-trier.de/xml/>，利用Hadoop中的Mahout实现一种基于分布式架构的频繁项集挖掘算法(例如，FP) Growth算法)。针对同一种算法和数据集，把分布式架构的和非分布式架构下的性能进行比较，例如，挖掘时间、挖掘性能等；
- 针对ImageNet数据集，利用Hadoop中的Mahout实现一种基于分布式架构的分类算法；针对同一种算法和数据集，把分布式架构的和非分布式架构下的性能进行比较，例如，分类时间、分类性能等；
- 自行选择一个至少包含5万个对象的公开数据集，针对该数据集，利用Hadoop中的Mahout实现一种基于分布式架构的聚类算法；针对同一种算法和数据集，把分布式架构的和非分布式架构下的性能进行比较，例如，聚类时间、聚类性能等；
- 人数：4-5人；

Mahout可参考，<https://mahout.apache.org/>

## 项目结构

```txt
.
├── datasets
│  ├── extract
│  └── validate.py
├── deploy
│  ├── docker
│  │  └── mahout
│  └── k8s
│     ├── Dockerfile
│     ├── download.sh
│     ├── Makefile
│     ├── value-1node.yaml
│     └── value-3node.yaml
├── Makefile
├── output
│  ├── DBLP
│  │  ├── DBLP.xml
│  │  ├── mahout_run.sh
│  │  ├── preprocessing.sh
│  │  └── view.sh
│  └── forest
│     ├── covtype.csv
│     ├── mahout_run.sh
│     ├── preprocessing.sh
│     ├── readme.md
│     └── view.sh
├── poetry.lock
├── pyproject.toml
├── readme.md
├── script
│  ├── data_preprocessing.sh
│  ├── data_put2hdfs.sh
│  ├── init_project.sh
│  ├── kube_cp.sh
│  ├── split_DBLP.sh
│  ├── start_hadoop_service.sh
│  └── unzip.sh
└── src
   ├── DBLP
   ├── forest
   └── ImageNet
```

## 系统架构

```mermaid
graph TB
    subgraph Infrastructure
        K8S[Kubernetes Cluster]
        K1N["1-Node Config"]:::k8s
        K3N["3-Node Config"]:::k8s
        DOC[Docker Container]:::docker
        HAD[Hadoop Service]:::hadoop
    end

    subgraph "Data Processing"
        DMS[Dataset Management]:::data
        EXT[Extraction Service]:::process
        VAL[Validation Service]:::process
        PRE[Preprocessing Pipeline]:::process
    end

    subgraph "Output Processing"
        DBLP[DBLP Processor]:::output
        FOR[Forest Processor]:::output
    end

    subgraph "Configuration & Build"
        ENV[Environment Config]:::config
        MK[Build System]:::config
        INIT[Project Init]:::config
    end

    %% Infrastructure Relationships
    K8S --> K1N
    K8S --> K3N
    K3N --> DOC
    DOC --> HAD

    %% Data Processing Flow
    DMS --> EXT
    EXT --> VAL
    VAL --> PRE
    PRE --> DBLP
    PRE --> FOR

    %% Configuration Dependencies
    ENV -.-> DMS
    ENV -.-> HAD
    MK -.-> K8S
    INIT -.-> ENV

    %% Component Mappings
    click DMS "https://github.com/yeisme/Hadoop_bigdata_analysis/tree/main/datasets/"
    click EXT "https://github.com/yeisme/Hadoop_bigdata_analysis/tree/main/datasets/extract/"
    click VAL "https://github.com/yeisme/Hadoop_bigdata_analysis/blob/main/datasets/validate.py"
    click PRE "https://github.com/yeisme/Hadoop_bigdata_analysis/blob/main/script/data_preprocessing.sh"
    click HAD "https://github.com/yeisme/Hadoop_bigdata_analysis/blob/main/script/start_hadoop_service.sh"
    click K1N "https://github.com/yeisme/Hadoop_bigdata_analysis/blob/main/deploy/k8s/value-1node.yaml"
    click K3N "https://github.com/yeisme/Hadoop_bigdata_analysis/blob/main/deploy/k8s/value-3node.yaml"
    click DOC "https://github.com/yeisme/Hadoop_bigdata_analysis/tree/main/deploy/k8s/Dockerfile"
    click DBLP "https://github.com/yeisme/Hadoop_bigdata_analysis/blob/main/output/DBLP/preprocessing.sh"
    click FOR "https://github.com/yeisme/Hadoop_bigdata_analysis/blob/main/output/forest/preprocessing.sh"
    click ENV "https://github.com/yeisme/Hadoop_bigdata_analysis/blob/main/.env"
    click MK "https://github.com/yeisme/Hadoop_bigdata_analysis/tree/main/Makefile"
    click INIT "https://github.com/yeisme/Hadoop_bigdata_analysis/blob/main/script/init_project.sh"

    %% Styling
    classDef k8s fill:#326CE5,color:white
    classDef docker fill:#2496ED,color:white
    classDef hadoop fill:#FF6600,color:white
    classDef data fill:#4CAF50,color:white
    classDef process fill:#81C784,color:white
    classDef output fill:#FFD700,color:black
    classDef config fill:#9E9E9E,color:white

    %% Legend
    subgraph Legend
        L1[Kubernetes]:::k8s
        L2[Docker]:::docker
        L3[Hadoop]:::hadoop
        L4[Data Management]:::data
        L5[Processing]:::process
        L6[Output]:::output
        L7[Configuration]:::config
    end
```
