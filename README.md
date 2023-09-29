# openkore-docker

> docker 一键部署 openkore RO Bot

------


## 0x00 概要

OpenKore 和传统的 RO Bot 不同，它是纯命令行交互、没有 UI 界面，而且支持多平台运行，这就为容器化提供了基础支持。

但因为 OpenKore 的安装依赖大部分都是系统基础依赖，导致与用户环境兼容性的问题突出，解决这些问题本身比安装过程更为繁琐。

而容器化就是目前最好的解决方案。

- 官方 [源码](https://github.com/OpenKore/openkore)
- 官方 [wiki](https://openkore.com/wiki/Main_Page) 
- 官方 [论坛](https://forums.openkore.com/)

[![Openkore - AIBot 实机演示](./imgs/01.jpg)](https://www.bilibili.com/video/BV14w411Y78k)

<details>
<summary><b>更多实机展示</b></summary>
<br/>

![](./02.gif)

</details>



## 0x10 目录结构说明

```
openkore-docker
├── bin ............................. [Docker 控制脚本]
│   ├── build.sh|ps1 ................ [构建镜像]
│   ├── clean.sh|ps1 ................ [清理镜像]
│   ├── deploy.sh|ps1 ............... [发布镜像]
│   ├── run.sh|ps1 .................. [运行容器]
│   ├── link.sh|ps1 ................. [使用 openkore 连接到 RO 服务器]
│   ├── stop.sh|ps1 ................. [停止容器]
│   └── terminal.sh|ps1 ............. [进入容器终端]
├── Dockerfile ...................... [Docker 镜像构建脚本]
├── openkore ........................ [封装到 Dockerfile 的子模块]
├── res ............................. [封装到 Dockerfile 的资源]
│   ├── bin
│   │   ├── .docker-entrypoint.sh ... [Docker 启动入口脚本]
│   │   └── .wrapper.sh ............. [Docker 主进程维持]
│   ├── openkore .................... [openkore 运行前可以固化的配置]
│   │   └── tables
│   │       └── demo.servers.txt .... [服务器连接信息（示例）]
│   └── readlinetest.c .............. [用于验证 readline]
├── docker-compose.yml .............. [Docker 服务编排脚本]
├── volumes
│   └── openkore .................... [openkore 运行时可以修改的配置]
│       └── control ................. [控制 Bot 的行为策略]
├── LICENSE
├── imgs ............................ [插图]
└── README.md ....................... [说明文档]
```

## 0x20 环境要求

![](https://img.shields.io/badge/Platform-Linux%20amd64-brightgreen.svg) ![](https://img.shields.io/badge/Platform-Mac%20amd64-brightgreen.svg) ![](https://img.shields.io/badge/Platform-Windows%20x64-brightgreen.svg)


## 0x30 部署步骤

### 0x31 项目构建

1. 宿主机安装 docker、docker-compose
2. 下载仓库： `git clone https://github.com/Casual-Ragnarok/openkore-docker`
3. 打开仓库目录： `cd openkore-docker`
4. 构建镜像： `./build.sh|ps1`


### 0x32 设置服务连接配置

1. 复制 [`volumes/openkore/control/demo.config.txt`](./volumes/openkore/control/demo.config.txt) 到 `volumes/openkore/control/config.txt`
2. 复制 [`volumes/openkore/tables/demo.servers.txt`](./volumes/openkore/tables/demo.servers.txt) 到 `volumes/openkore/tables/servers.txt`

> `config.txt` 无需做任何改动，连接到服务器时会交通过互填写。之所以要手动复制这两份文件，是因为在 [`.gitignore`](./.gitignore) 中对它们做了忽略处理，避免提交敏感信息到 git 仓库

3. 修改 `servers.txt` 文件，添加自己部署的 RO 服务器连接信息


### 终端运行




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