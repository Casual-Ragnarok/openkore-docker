#!/bin/bash
# ------------------------------------------------------------------
# 用于确保容器不会挂起的前台进程。
# 核心服务进程运行在后台，可以随意重启
# ------------------------------------------------------------------


/bin/.docker-entrypoint.sh


# 接受外部参数、执行命令 perl openkore.pl --control=xxxxxx
if [ -n "$1" ]; then
    cd ${OPENKORE_DIR}
    perl ./openkore.pl $1
fi


while true ; do
    sleep 600
done

exit 0
