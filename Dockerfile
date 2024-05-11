# 使用官方的 Python 镜像
FROM python:3.9-slim

# 设置工作目录
WORKDIR /app

# 复制项目文件到工作目录
COPY . /app/

# 设置阿里云的 apt 源
RUN echo "deb http://mirrors.aliyun.com/debian/ buster main contrib non-free" > /etc/apt/sources.list \
    && echo "deb-src http://mirrors.aliyun.com/debian/ buster main contrib non-free" >> /etc/apt/sources.list \
    && echo "deb http://mirrors.aliyun.com/debian-security buster/updates main" >> /etc/apt/sources.list \
    && echo "deb-src http://mirrors.aliyun.com/debian-security buster/updates main" >> /etc/apt/sources.list \
    && echo "deb http://mirrors.aliyun.com/debian/ buster-updates main contrib non-free" >> /etc/apt/sources.list \
    && echo "deb-src http://mirrors.aliyun.com/debian/ buster-updates main contrib non-free" >> /etc/apt/sources.list


# 安装系统依赖，包括 MySQL 客户端库
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        default-libmysqlclient-dev \
        libgnutls28-dev \
        zlib1g-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 创建 pip 配置文件
#RUN mkdir -p /root/.pip \
#    && echo "[global]\nindex-url = https://mirrors.tencent.com/pypi/simple/\n" > /root/.pip/pip.conf

# 安装项目依赖
RUN pip install --no-cache-dir -r requirements.txt

# 打开端口，可以根据你的 Django 项目配置修改
EXPOSE 8000

# 运行 Django 项目
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]