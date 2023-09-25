#!/bin/bash
#------------------------------------------------
# 运行 docker 服务
# sudo bin/run.sh
#------------------------------------------------
# 注： host.docker.internal 是 docker 内访问宿主机上的服务的固定地址
#------------------------------------------------


docker-compose up -d
docker ps
echo "Docker is running: ${PROTOCOL}://${DOMAIN}:7080"
