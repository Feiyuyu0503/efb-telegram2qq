# 第一阶段：构建阶段
FROM python:3.9 AS builder
LABEL author="feiyuyu"
LABEL email="admin@feiyuyu.net"

# 设置工作目录
WORKDIR /build

# 安装系统依赖
RUN apt-get update && \
    apt-get install -y git ffmpeg libmagic1 libssl-dev libopus0 && \
    rm -rf /var/lib/apt/lists/*

# 复制仅在构建中需要的文件
COPY requirements.txt .

# 安装Python依赖
RUN pip install --no-cache-dir -r requirements.txt

# 第二阶段：部署阶段
FROM python:3.9-slim
WORKDIR /root

# 创建映射文件夹
RUN mkdir -p /root/.ehforwarderbot/profiles/default
RUN mkdir -p /root/go-cqhttp

# 安装运行时必需的系统依赖
RUN apt-get update && \
    apt-get install -y libmagic1 libopus0 && \
    rm -rf /var/lib/apt/lists/*

# 从构建阶段复制已安装的依赖
COPY --from=builder /usr/local/lib/python3.9/site-packages /usr/local/lib/python3.9/site-packages
COPY --from=builder /usr/local/bin /usr/local/bin

# 复制入口脚本
COPY entrypoint.sh /

# 设置脚本的执行权限
RUN chmod +x /entrypoint.sh

# 设置entrypoint.sh为启动脚本
CMD ["/entrypoint.sh"]

