# .ide/Dockerfile
FROM node:22

WORKDIR /root

# 安装 ssh 服务
RUN apt-get update && apt-get install -y wget unzip openssh-server

# 创建 /ide_cnb 目录，用于安装 IDE，注意安装路径必须是这个，便于自动识别环境中支持哪些 ide
RUN mkdir -p /ide_cnb

# 选择安装下方其中一个或多个 IDE

# 安装 GoLand
RUN wget https://download.jetbrains.com/go/goland-2024.3.3.tar.gz
RUN tar -zxvf goland-2024.3.3.tar.gz -C /ide_cnb

# 安装 IntelliJ IDEA，安装路径为 /root/idea-IC-223.8617.56
RUN wget https://download.jetbrains.com/idea/ideaIC-2024.3.3.tar.gz
RUN tar -zxvf ideaIC-2024.3.3.tar.gz -C /ide_cnb

# 安装 PhpStorm
RUN wget https://download.jetbrains.com/webide/PhpStorm-2024.3.3.tar.gz
RUN tar -zxvf PhpStorm-2024.3.3.tar.gz -C /ide_cnb

# 安装 PyCharm
RUN wget https://download.jetbrains.com/python/pycharm-community-2024.3.3.tar.gz
RUN tar -zxvf pycharm-community-2024.3.3.tar.gz -C /ide_cnb

# 安装 RubyMine
RUN wget https://download.jetbrains.com/ruby/RubyMine-2024.3.3.tar.gz
RUN tar -zxvf RubyMine-2024.3.3.tar.gz -C /ide_cnb

# 安装 WebStorm
RUN wget https://download.jetbrains.com/webstorm/WebStorm-2024.3.3.tar.gz
RUN tar -zxvf WebStorm-2024.3.3.tar.gz -C /ide_cnb

# 安装 CLion
RUN wget https://download.jetbrains.com/cpp/CLion-2024.3.3.tar.gz
RUN tar -zxvf CLion-2024.3.3.tar.gz -C /ide_cnb

# 安装 RustRover
RUN wget https://download.jetbrains.com/rustrover/RustRover-2024.3.5.tar.gz
RUN tar -zxvf RustRover-2024.3.5.tar.gz -C /ide_cnb

# 安装 Rider
RUN wget https://download.jetbrains.com/rider/JetBrains.Rider-2024.3.5.tar.gz
RUN tar -zxvf JetBrains.Rider-2024.3.5.tar.gz -C /ide_cnb

# 安装 code-server(VSCode WebIDE 支持)
RUN curl -fsSL https://code-server.dev/install.sh | sh \
  && code-server --install-extension redhat.vscode-yaml \
  && code-server --install-extension orta.vscode-jest \
  && code-server --install-extension dbaeumer.vscode-eslint \
  && code-server --install-extension waderyan.gitblame \
  && code-server --install-extension mhutchie.git-graph \
  && code-server --install-extension donjayamanne.githistory

ENV LANG C.UTF-8
