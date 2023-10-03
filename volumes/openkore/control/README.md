# Bot 行为策略控制配置

------


| 分类 | 配置文件 | 官方文档 | 说明 |
|:---|:---|:---:|:---|
| 核心配置 | [config.txt](config./.txt) | [wiki](https://openkore.com/wiki/Category:config.txt) | 主配置文件，是 Bot 登录 RO 服务器的主配置文件，<br/>连接信息主要在第一次登录时通过交互方式配置。 |
|  | [sys.txt](./sys.txt) | [wiki](https://openkore.com/wiki/Category:sys.txt) | 系统配置文件，是系统参数的配置文件，<br/>例如语言、插件、总线等等的配置。 |
| 一般行为配置 | [items_control.txt](./items_control.txt) | [wiki](https://openkore.com/wiki/items_control.txt) | 道具使用策略 |
|  | [mon_control.txt](./mon_control.txt) | [wiki](https://openkore.com/wiki/mon_control.txt) | 对抗魔物策略 |
|  | [priority.txt](./priority.txt) | [wiki](https://openkore.com/wiki/priority.txt) | 当被复数魔物攻击时、击杀它们的优先级 |
|  | [pickupitems.txt](./pickupitems.txt) | [wiki](https://openkore.com/wiki/pickupitems.txt) | 自动拾取策略 |
|  | [routeweights.txt](./routeweights.txt) | [wiki](https://openkore.com/wiki/routeweights.txt) | 自动寻路所经过的地图的权重（倾向走或避开哪些地图） |
|  | [timeouts.txt](./timeouts.txt) | [wiki](https://openkore.com/wiki/timeouts.txt) | 超时配置文件（控制行为间隔，使得 bot 看起来更像真人） |
|  | [avoid.txt](./avoidavoid.txt) | [wiki](https://openkore.com/wiki/avoid.txt) | 自动避开特定玩家 |
| 特殊行为配置 | [arrowcraft.txt](./arrowcraft.txt) | [wiki](https://openkore.com/wiki/arrowcraft.txt) | 自动制作箭（仅弓箭手职业有用） |
|  | [shop.txt](./shop.txt) | [wiki](https://openkore.com/wiki/shop.txt) | 自动挂店（需要拥有 露天商店 技能） |
|  | [buyer_shop.txt](./buyer_shop.txt) | [wiki](https://openkore.com/wiki/buyer_shop.txt) | 自动挂店（采购商店，需要消耗[采购商店执照](https://irowiki.org/wiki/Buying_Store)） |
|  | [chat_resp.txt](./chat_resp.txt) | [wiki](https://openkore.com/wiki/chat_resp.txt) | 自动聊天（此处可以接入 ChatGPT） |
|  | [overallAuth.txt](./overallAuth.txt) | [wiki](https://openkore.com/wiki/overallAuth.txt) | 授权 bot 是否允许在 openKore 的控制台里面聊天 |
|  | [responses.txt](./responses.txt) | [wiki](https://openkore.com/wiki/responses.txt) | 自动对聊天框的命令做出响应（回复消息、使用技能等） |
| 其他配置 | [consolecolors.txt](./consolecolors.txt) | [wiki](https://openkore.com/wiki/consolecolors.txt) | 控制台打印消息的颜色 |
|  | [poseidon.txt](./poseidon.txt) | [wiki](https://openkore.com/wiki/Poseidon) | 海神服务器（在 RO 服务端和客户端之间搭建的一个[代理服务器](https://github.com/Casual-Ragnarok/poseidon)，用于截获游戏数据） |


