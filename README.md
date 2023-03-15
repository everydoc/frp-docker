# frp-docker
A docker image based on [official frp](https://github.com/fatedier/frp)


## 使用

`FRP`参数指定启动项，值为`frps`代表启动frps，值为`frpc`代表启动frpc

### frps
```shell
docker run -d --name frps -e FRP=frps -v /etc/frp/frps.ini:/frp/frps.ini --network host imjcker/frp:latest

```

### frpc
```shell
docker run -d --name frpc -e FRP=frpc -v /etc/frp/frpc.ini:/frp/frpc.ini --network host imjcker/frp:latest

```
