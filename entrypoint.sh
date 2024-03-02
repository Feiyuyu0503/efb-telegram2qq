#!/bin/sh

# 启动go-cqhttp
cd /root/go-cqhttp
/root/go-cqhttp/go-cqhttp -c /root/go-cqhttp/config.yml &

# 等待一段时间确保gocqhttp完全启动
sleep 30

# 启动ehforwarderbot
cd /root
ehforwarderbot

