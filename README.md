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

- 复制 [`volumes/openkore/tables/demo.servers.txt`](./volumes/openkore/tables/demo.servers.txt) 到 `volumes/openkore/tables/servers.txt`
- 修改 `servers.txt` 文件，添加自己部署的 RO 服务器连接信息，其中最开始三个的 `z_YourRO - xxxxxx` 都是使用了最新的 kRO_RagexeRE_2021_11_03 封包，也是截至目前（2023-10-01）openkore 所能支持 rAthena 的最新版本，实测可以支持到 kRO 20220406。
- 运行 openkore: `./run.sh|ps1`

> 之所以要复制这份文件，是因为其中包含了敏感信息，故在 [`.gitignore`](./.gitignore) 中对它们做了忽略处理，避免误操作提交到 git 仓库。详细的配置说明可参考[这里](./volumes/openkore/tables/README.md)。

### 0x33 连接到服务器

- 复制 [`volumes/openkore/control/demo.config.txt`](./volumes/openkore/control/demo.config.txt) 到 `volumes/openkore/control/config.txt`，但是无需做任何改动，连接到服务器时会交通过互填写。
- 连接到 RO 服务器: `./link.sh|ps1`，交互过程中需要填写:
  - 选择上一步中配置好的服务器
  - 输入已有的游戏帐号
  - 输入对应的游戏密码
  - 选择区域服务器
  - 选择角色
- 交互过程中会不断更新 `config.txt` 这个文件，这也是在 [`.gitignore`](./.gitignore) 中对它做忽略处理的原因，因为里面包含的帐密
- 交互完成后就会根据 [`volumes/openkore/control`](./volumes/openkore/control) 预设的策略进行挂机

> control 的行为策略可以自己按需修改，修改后需要重新连接。详细的配置说明可以参考[这里](./volumes/openkore/control/README.md)


## 0x34 断开连接

- 断开连接可以在命令行输入 `Ctrl+C` 或 `Command+C`
- 若需完全停止 openkore ，可执行 `./stop.sh|ps1`

