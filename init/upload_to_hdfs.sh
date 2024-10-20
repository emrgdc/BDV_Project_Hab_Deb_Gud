#!/bin/bash

echo "Waiting for HDFS to leave safemode..."
hdfs dfsadmin -safemode wait

echo "Creating HDFS directory /user/hadoop/input..."
hdfs dfs -mkdir -p /user/hadoop/input

echo "Uploading data from /data to HDFS..."
hdfs dfs -put -f /data/* /user/hadoop/input/

echo "Data upload to HDFS completed."
