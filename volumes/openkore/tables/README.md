# 服务器连接配置

------

在 openkore/tables/servers.txt（挂载目录为 volumes/openkore/control）下主要配置了所有 RO 服务器连接信息。


每一个服务器配置的[完整配置模板](https://openkore.com/wiki/Connectivity_Guide#Configuring_Openkore)如下：

```
[<server name>]
ip <number/host>
port <number>
version <number>
master_version <number> 
serverType <serverType name>
serverEncoding <encoding>
charBlockSize <number>
addTableFolders <folder path>

# following options are optional
private <boolean>
recvpackets <file name>
chatLangCode <boolean>
storageEncryptKey <encrypt key>
field_<location> <filename>
clientHash <hex string>
captcha <boolean>

gameGuard <number>

secureLogin <boolean>
secureLogin_type <type>
secureLogin_requestCode <hex string>
secureLogin_account <boolean>

preLoginCode <boolean>

paddedPackets <boolean>
paddedPackets_attackID <packet switches>
paddedPackets_skillUseID <packet switches>

masterLogin_packet <packet switch>

OTP_ip <IP_or_hosthame>
OTP_port <number>

dead <boolean>
dead_message <any text>
title <any text>

pinCode <boolean>
charDeleteDateType <boolean>
blockingPlayerCancel <boolean>
rankingSystemType <boolean>
itemListType <boolean>
ignoreAntiCheatWarning <boolean>
```

例如对于 PACKETVER = 20211103 的 rAthena 服务端，其服务器连接配置就是:

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

## 0x01 server name

服务配置的名称，名字可任意设定，这个名字在连接时、会出现在服务器选单中。由于选单是按字母序排序的，故其首字母可以控制这份服务器配置在选单中出现的位置。

![](./imgs/03.jpg)

> 尽量避免更改已存在的服务名称，以免破坏已存在的配置。建议可以新增一条服务配置记录。


## 0x02 ip

需要登录的 RO 服务器 IP，又分几种情况：

- 本地提供服务（docker 服务暴露到宿主机也算）: 固定值 host.docker.internal
- docker 内提供服务（没有暴露到宿主机）: 该服务需要使用 [docker-compose.yml](./docker-compose.yml) 的网段，并指定任意一个 IP
- 局域网提供服务: 配置为局域网的 IP
- 云主机提供服务: 配置为云主机的公网 IP
- 通过反向代理提供服务: 配置为代理的公网 IP

> `127.0.0.1` 是 openkore-docker 容器本地的 IP，除非用这个仓库作为基础镜像搭建 RO 服务端，不然不论哪种情况都不应配置为 `127.0.0.1`


## 0x03 port

需要登录的 RO 服务器端口，默认是 6900，非必要不需要改。


## 0x04 version 和 master_version

根据[官方](https://openkore.com/wiki/Connectivity_Guide)的介绍，这两个值需要通过 WPE 或 Wireshark 抓取封包获得，以 [WPE](https://docs.ragnarok.buzz/01-developer/02-tools/WPE_v3.0.zip) 为例：

运行 RO 客户端 ragnarok.exe，但是停在输入帐密的界面，不要登录。然后运行 WPE，点击 Target Programs 按钮：

![](../../../imgs/07.jpg)

找到 ragnarok.exe 并双击选中为抓包目标（部分补丁可能改过进程名，如: xxxRO.exe、xxxx.dll、xxxxx.bin 等，按实际选择即可）

![](../../../imgs/08.jpg)

点击 WPE 的抓包按钮，然后切换到 RO 的登录界面登录，在输入框随便输入帐密（可以不正确）、点击登录

![](../../../imgs/09.jpg)

再切换到 WPE ，点击停止抓包按钮：

![](../../../imgs/10.jpg)

此时可以看到刚才登录时抓到的包：

![](../../../imgs/11.jpg)

如上图这个发送出去的封包（可以看到 RO 登录帐密是明文传输的，没有做加密处理），其中：

1. 对应 `version`，需要按照小端序（little-endian）将这 4 个十六进制数重新排列。这里为 `14 00 00 00`，小端序就是从有到左倒过来 `00 00 00 14`，转成十进制就是 `20`
2. 对应 `ip`，RO 登录服务 IP，如果前面配 IP 不知道取什么值，可以在这里获取
3. 对应 `port`，RO 登录服务端口，如果前面配端口知道取什么值，可以在这里获取
4. 对应 `master_version`，固定是最后 1 个十六进制数，这里为 `10`，转成十进制就是 `2`

> 事实上只有官服才会校验版本，实测在 rAthena 系列中配置为任意值都会不影响 openkore 登录。


## 0x05 serverType

服务器类型。每个官服都有自己的服务器类型，rAthena 必须根据可执行文件的编译日期使用 kRO 服务器类型，而且还需要 openkore 支持。

根据[官方说明](https://openkore.com/wiki/serverType#kRO_serverTypes_for_private_servers)，rAthena 私服的固定格式为：

```
kRO_RagexeRE_<year>_<month>_<date><letter>
```

官方提供了一张[枚举表](https://openkore.com/wiki/serverType#Server_Version)，建议通过 [PEViewer](https://docs.ragnarok.buzz/01-developer/02-tools/PEViewer.zip) 等工具查看 ragnarok.exe 文件头中的编译日期、然后根据日期查表获得对应的的 serverType。

![](../../../imgs/13.jpg)

但是枚举表更新有延迟，通过 [github issue](https://github.com/OpenKore/openkore/issues/3792) 得知，目前 openkore 支持 kRO 最新的版本是 2021-11-03，对应网络文件是 `./openkore/src/Network/Receive/kRO/RagexeRE_2021_11_03.pm`、包解码文件是 `openkore/tables/kRO/Ragexe_2021_11_03/recvpackets.txt`。

对应 rAthena 的 PACKETVER 也是 20211103:

![](./../../../imgs/12.jpg)

> RO 服务器发送给客户端的网络数据是一个字节流，openkore 必须能够识别字节流中的消息才能对其进行处理。但是每条消息的大小可能因服务器而异，recvpackets.txt 则包含了每条消息的大小信息，以便 openkore 可以正确地将字节流拆分成消息。recvpackets.txt 的生成方式详见官方[说明](https://openkore.com/wiki/Packet_Length_Extractor)。


如果 serverType 配置不当，可能会出现以下异常：

- Packet Tokenizer: Unknown switch: xxxx
- 几秒钟后断开连接
- openkore 无法识别 NPC、玩家和怪物（显示为未知）

此时需要利用 Packet Extractor 或 JCV's RO Tools 生成对应的 recvpackets 后、再配置其 serverType。

> 实测 serverType = kRO_RagexeRE_2021_11_03 时，依然能兼容 PACKETVER = 20211117 版本的包解码。


## 0x06 serverEncoding

服务端使用的编码，编码列表可以在[这里]选择。如果发现连接后乱码，需要变更编码配置。

一般中文搭建的 rAthena 服务端都是 GBK 编码。


## 0x07 charBlockSize

在角色选择界面上，用于描述每个字符的数据块（received_characters）的长度（以字节为单位）。

这个值每个版本迭代都可能会变化，因为它的来源就是 rAthena 源码中 mmo_char_tobuf 所生成的结构体的块大小，但是这个大小在不同版本中都是动态不固定的。

一般的服务器运营者很难获取到这个值，即使是运维人员、甚至是开发人员也不好获取。

官方有在维护一张各个版本的[枚举值表](https://openkore.com/wiki/charBlockSize)，但是因为有人在[论坛](https://forums.openkore.com/viewtopic.php?t=9806)里面建议 openkore 自动获得这个值，所以目前这个值已经处于半弃用状态了。

20211117 版本的 rAthena 可以配置为最后一个枚举值 175。


## addTableFolders



# following options are optional
private <boolean>
recvpackets <file name>
chatLangCode <boolean>
storageEncryptKey <encrypt key>
field_<location> <filename>
clientHash <hex string>
captcha <boolean>

gameGuard <number>

secureLogin <boolean>
secureLogin_type <type>
secureLogin_requestCode <hex string>
secureLogin_account <boolean>

preLoginCode <boolean>

paddedPackets <boolean>
paddedPackets_attackID <packet switches>
paddedPackets_skillUseID <packet switches>

masterLogin_packet <packet switch>

OTP_ip <IP_or_hosthame>
OTP_port <number>

dead <boolean>
dead_message <any text>
title <any text>

pinCode <boolean>
charDeleteDateType <boolean>
blockingPlayerCancel <boolean>
rankingSystemType <boolean>
itemListType <boolean>
ignoreAntiCheatWarning <boolean>

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



