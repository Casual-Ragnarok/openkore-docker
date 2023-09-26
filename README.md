# openkore-docker

> docker 一键部署 openkore 机器人

------


## 概要

[![Openkore - AIBot 实机演示](./imgs/01.jpg)](https://www.bilibili.com/video/BV14w411Y78k)

<details>
<summary><b>更多实机展示</b></summary>
<br/>

![](./02.gif)

</details>



## 目录结构说明

```
mstream-docker
├── music ....................... [音乐文件只要放到此目录下即可被识别，支持多目录嵌套]
├── config ...................... [mStream 配置目录]
├── docker-compose.yml .......... [mStream 镜像构建脚本]
├── run.sh ...................... [mStream 服务一键启动脚本]
├── stop.sh ..................... [mStream 服务一键停止脚本]
├── imgs ........................ [README 插图目录]
└── README.md ................... [本仓库说明文档]
```

## 环境要求

![](https://img.shields.io/badge/Platform-Linux%20amd64-brightgreen.svg) ![](https://img.shields.io/badge/Platform-Mac%20amd64-brightgreen.svg) ![](https://img.shields.io/badge/Platform-Windows%20x64-brightgreen.svg)


## 部署步骤

### 1. 项目构建

- 宿主机安装 docker、docker-compose
- 宿主机安全组/防火墙（iptables/firewall）放行 9000 端口的入口流量
- 下载仓库： `git clone https://github.com/lyy289065406/mstream-docker /usr/local/mstream-docker`
- 打开仓库目录： `cd /usr/local/mstream-docker`
- 构建镜像并运行： `./run.sh -u admin -p admin123`
- 浏览器访问 [http://127.0.0.1:9000](http://127.0.0.1:9000) 即可使用

> 构建时设置的是 mStream 前端的登录账密





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


git remote set-url git@ro.github.com:Casual-Ragnarok/openkore-docker.git