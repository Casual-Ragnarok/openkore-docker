#!/bin/bash
#------------------------------------------------
# 清理镜像、日志
# bin/clean.sh
#------------------------------------------------

echo "clean logs ..."
rm -rf logs

echo "clean images ..."
IMAGE_NAME="openkore"
docker rmi -f $(docker images | grep "$IMAGE_NAME" | awk '{print $3}')
docker rmi -f $(docker images | grep "none" | awk '{print $3}')

echo "finish ."