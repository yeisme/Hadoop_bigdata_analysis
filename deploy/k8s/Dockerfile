FROM farberg/apache-hadoop:3.3.2

# 安装 Mahout
COPY apache-mahout-distribution-0.13.0.tar.gz /opt/

RUN tar -xzf /opt/apache-mahout-distribution-0.13.0.tar.gz -C /opt/ \
    && rm /opt/apache-mahout-distribution-0.13.0.tar.gz


ENV MAHOUT_HOME=/opt/apache-mahout-distribution-0.13.0
ENV PATH=$PATH:$MAHOUT_HOME/bin
