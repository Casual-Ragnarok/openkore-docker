#!/bin/bash
#------------------------------------------------
# 连接到 RO 服务器
# bin/link.sh
#------------------------------------------------

bin/run.sh
CONTAINER_ID=`docker ps | grep 'openkore' | awk '{print $1}'`
docker exec -it ${CONTAINER_ID} perl /app/openkore/openkore.pl
