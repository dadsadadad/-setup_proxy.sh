bash
#!/bin/bash

# 获取用户输入的域名和用户名密码
echo "请输入您的域名："
read domain
echo "请输入用户名："
read username
echo "请输入密码："
read password

# 安装Nginx
sudo apt-get update
sudo apt-get install -y nginx

# 安装gost
wget
https://github.com/ginuerzh/gost/releases/download/v2.11.1/gost-linux-amd64-2.11.1.gz

gunzip gost-linux-amd64-2.11.1.gz
chmod +x gost-linux-amd64-2.11.1
sudo mv gost-linux-amd64-2.11.1 /usr/local/bin/gost

# 创建gost配置文件
cat < gost.json
{
"Debug": true,
"Retries": 0,
"ServeNodes": [
"http2://:8080?auth=$username:$password"
]
}
EOT

# 配置Nginx
sudo bash -c "cat > /etc/nginx/conf.d/proxy.conf <
proxy

location / {
proxy
proxy
st;
proxy
set
header Host \$host;
proxy
set
header X-Real-IP \$remote
proxy
proxy
set
header X-Forwarded-For \$proxy
add
x
forwarded
for;
}
}
EOT"

# 重启Nginx
sudo systemctl restart nginx

# 启动gost
nohup gost -C gost.json > gost.log 2>&1 &
