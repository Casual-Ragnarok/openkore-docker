
```
[z_YourRO - xxxxxx]
ip ${Your_Server_Public_IP}
port 6900
master_version 1
version 28
serverType kRO_RagexeRE_2021_11_03
serverEncoding GBK
gameGuard 0
storageEncryptKey 0x050B6F79, 0x0202C179, 0x0E20120, 0x04FA43E3, 0x0179B6C8, 0x05973DF2, 0x07D8D6B, 0x08CB9ED9
addTableFolders kRO/Ragexe_2021_11_03;iRO
charBlockSize 175
pinCode 0
charDeleteDateType 1
rankingSystemType 1
private 1
# sendCryptKeys ${PACKET_OBFUSCATION_KEY1},{PACKET_OBFUSCATION_KEY3},{PACKET_OBFUSCATION_KEY2}
```

各个解释如下：

- `[z_YourRO - xxxxxx]` 中括号内的名字可任意设定，这个名字在连接时、会出现在服务器选单中。由于选单是按字母序排序的，故首字母可以控制这份服务器配置在选单中出现的位置。

![](./imgs/03.jpg)

- `ip`: 你搭建的 RO 服务器 IP，又分几种情况：
  - 本地提供服务（docker 服务暴露到宿主机也算）: 固定值 host.docker.internal
  - docker 内提供服务（没有暴露到宿主机）: 该服务需要使用 [docker-compose.yml](./docker-compose.yml) 的网段，并指定任意一个 IP
  - 局域网提供服务: 配置为局域网的 IP
  - 云主机提供服务: 配置为云主机的公网 IP
  - 通过反向代理提供服务: 配置为代理的公网 IP

> `127.0.0.1` 是 openkore-docker 容器本地的 IP，除非用这个仓库作为基础镜像搭建 RO 服务端，不然不论哪种情况都不应配置为 `127.0.0.1`

- `port`: 服务端口，RO 默认都是 6900
- `master_version`: https://openkore.com/wiki/Connectivity_Guide
- `version`: https://openkore.com/wiki/Connectivity_Guide





多号运行：
https://forums.openkore.com/viewtopic.php?t=15802
https://ro.private-servers-game.com/forum.php?mod=viewthread&tid=904

perl ./openkore.pl


# peek 中获取的密钥按以下顺序使用：
# sendCryptKeys 1, 3, 2
# https://openkore.com/wiki/Connectivity_Guide
# https://forums.openkore.com/viewtopic.php?t=212793


https://ragnabotko.blogspot.com/2011/09/how-to-run-openkore-to-your-ubuntu.html
https://openkore.com/wiki/How_to_run_OpenKore



https://openkore.com/wiki/Main_Page
https://openkore.com/wiki/Connectivity_Guide
https://forums.openkore.com/viewtopic.php?t=212793



https://openkore.com/wiki/Packet_Length_Extractor
https://misc.openkore.com/


perl ./openkore.pl --control="/app/accounts/A0000/"
perl ./openkore.pl --config="/app/accounts/A0001/config.txt"

