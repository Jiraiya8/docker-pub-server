# pub_server的docker版本

为官方pub_server提供一个Docker镜像
https://github.com/dart-archive/pub_server

## 使用方法

### Docker 部署

```shell
git clone https://github.com/Jiraiya8/pub_server_docker.git

cd pub_server_docker

docker build -t pub_server:latest .

docker run -d -p 8080:8080 -v $HOME/package-db:/root/package-db pub_server:latest

# 如果需要更多自定义参数，可以手动指定，比如监听地址

docker run -d -p 8005:8005 -v $HOME/package-db:/root/package-db pub_server:latest -h '0.0.0.0' -p 8005 -d /root/package-db
    
```


### Docker Compose 部署（推荐）

```shell

git clone https://github.com/Jiraiya8/pub_server_docker.git

cd pub_server_docker

docker-compose up -d

```

### 查看是否启动成功

浏览器输入 http://yourip:8080

如果打印 Not Found ，说明服务启动成功



