FROM jupyter/pyspark-notebook

USER root

# Install Java
RUN apt-get update && \
    apt-get install -y --no-install-recommends openjdk-8-jdk wget && \
    rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

# Install Hadoop client
RUN wget -qO- https://archive.apache.org/dist/hadoop/common/hadoop-2.7.4/hadoop-2.7.4.tar.gz | \
    tar -xz -C /opt/ && \
    ln -s /opt/hadoop-2.7.4 /opt/hadoop

ENV HADOOP_HOME=/opt/hadoop
ENV PATH=$PATH:$HADOOP_HOME/bin

# Copy Hadoop configuration files
COPY hadoop-config/* $HADOOP_HOME/etc/hadoop/

USER $NB_UID
