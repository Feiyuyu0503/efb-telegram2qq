# EFB-Telegram2QQ  
一个缝合项目，使用telegram收发qq消息，docker部署。   
感谢以下开源项目
- [efb](https://github.com/ehForwarderBot/ehForwarderBot)
- [efb-telegram-master](https://github.com/ehForwarderBot/efb-telegram-master)
- [efb-qq-slave](https://github.com/ehForwarderBot/efb-qq-slave)
- [efb-qq-plugin-go-cqhttp](https://github.com/ehForwarderBot/efb-qq-plugin-go-cqhttp)
- [go-cqhttp](https://github.com/Mrs4s/go-cqhttp)
- ...

## 食用方法  
```bash
git clone https://github.com/Feiyuyu0503/efb-telegram2qq
cd efb-telegram2qq
# 首先配置go-cqhttp，然后登录一遍qq
cd go-cqhttp
vim config.yml
./go-cqhttp
# 完成qq登录流程后，配置efb
cd .. # 回到项目根目录
vim efb/blueset.telegram/config.yaml
# 配置完成后，docker启动项目即可
docker run -it -d --restart=always --name efb -v $PWD/go-cqhttp/:/root/go-cqhttp -v $PWD/efb:/root/.ehforwarderbot/profiles/default feiyuyu/efb-telegram2qq
```
ps:写完Readme才发现，早就有一样且更全的[项目](https://github.com/sakarie9/TG-EFB-QQ-Docker)了，而且我很久以前还star过😂
