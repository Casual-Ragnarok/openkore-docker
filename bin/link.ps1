# PowerShell
#------------------------------------------------
# 连接到 RO 服务器
# bin/link.ps1
#------------------------------------------------

.\bin\run.ps1
$CONTAINER_ID = (docker ps | Select-String 'openkore').Line.Split(' ')[0]
docker exec -it $CONTAINER_ID perl /app/openkore/openkore.pl 
