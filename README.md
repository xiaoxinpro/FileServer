## 一、项目说明

FileServer项目基于Go语言实现的无依赖的轻量级文件服务器，所谓无依赖就是环境中无需Nginx或者Apache等Web服务器软件；轻量级表示软件体积小、运行时占用内存小、无需安装、单个文件，可放在U盘上实现即插即用；而文件服务器表示可以在浏览器中访问指定目录下的文件，主要应用是私有软件源服务器、文件下载服务器、静态文件资源服务器。

## 二、快速上手

### 1、直接运行

下载编译后的程序，直接运行即可实现文件服务器

```bash
./FileServer_linux_amd64
```

启动后会开启 `8080` 端口监听，将程序运行目录下的 `www` 文件夹创建为文件服务器跟目录

在浏览器中访问 `http://localhost:8080`，即可看到文件服务器目录。

### 2、Docker-compose部署（推荐）

使用 Docker-compose 可以十分便捷的部署 FileServer 服务，首先要确保服务器中已经安装了 Docker 和 Docker-compose。

创建一个 `docker-compose.yml` 文件：

```yaml
version: '3'
services:
  fileserver:
    image: chishin/fileserver:latest
    container_name: FileServer
    restart: unless-stopped
    ports:
      - '8080:8080'
    volumes:
      - ./www:/web/www
```

下载并启动容器：

```bash
docker-compose pull
docker-compose up -d
```

如果需要升级FileServer容器为最新版本，只需要执行：

```bash
docker-compose down
docker-compose pull
docker-compose up -d
```

### 3、Docker部署

首先你要按照完成Docker环境，然后执行以下命令创建容器：

```bash
docker run -d  -p 8080:8080 -v /volume1/www:/web/www chishin/fileserver:latest
```

其中 `8080` 表示软件服务器端口，`/volume1/www` 表示文件服务器在本地的根目录路径。

在浏览器中访问 `http://服务器IP:8080`，即可看到文件服务器目录。

### 4、群辉Docker运行

在群晖Docker的注册表中搜索 `chishin/fileserver` 并下行。

在映像中双击 `chishin/fileserver:latest`，在高级设置的`卷`中设置一个本地目录到`/web/www`

![](https://image.xiaoxin.pro/2022/05/24/5efb7b70393ae.png)

在 `端口设置` 中将一个本地 `8080` 端口映射到容器的 `8080` 端口

![](https://image.xiaoxin.pro/2022/05/24/31869673a01d5.png)

应用并一直下一步启动容器，访问群晖IP的 `8080` 端口测试完成。

## 三、使用说明

FileServer支持命令与环境变量两种配置方式，可根据使用环境自行选择配置方式。

### 1、命令行
FileServer默认采用命令行模式配置，命令行接收的参数如下：

| 参数名     | 默认值     | 备注                            |
|---------|---------|-------------------------------|
| -c      | default | 配置方式选择：default（命令行）、env（环境变量） |
| -port   | 8080    | 文件服务器监听端口                     |
| -path   | ./www   | 文件服务器本地根目录路径，可以是相对路径，也可以是绝对路径 |

### 2、环境变量

当需要使用环境配置时，必须使用如下命令行启动文件服务器：

```bash
./FileServer -c env
```

除以上命令行外的其他命令行参数与环境变量冲突时均使用环境变量替换。

可接收的环境变量与对应的命令行参数如下：

| 环境变量名    | 命令行参数名 | 备注           |
|----------|--------|--------------|
| WEB_PORT | -port  | 文件服务器监听端口    |
| WEB_PATH | -path  | 文件服务器本地根目录路径 |

## License

Copyright © 2020 xiaoxinpro/FileServer Released under the GPL-3.0 License.

> 注：FileServer 开源的目的是大家能够在本站的基础之上有所启发，做出更多新的东西。 如果你使用这个开源项目，请注明本项目开源地址。














