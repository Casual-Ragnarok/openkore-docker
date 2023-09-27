#!/bin/bash
# ----------------------------------------


# 覆盖挂载目录的自定义配置到 openkore 目录
MOUNT_DIR="/app/custom/openkore"
OPENKORE_DIR="/app/openkore"
cp -r ${MOUNT_DIR}/* ${OPENKORE_DIR}
