FROM expm02/ubuntu-gcc-cmake-docker:latest


# -----------------------------------------------------
# 安装 openkore 环境
# https://openkore.com/wiki/How_to_run_OpenKore
# -----------------------------------------------------
RUN apt-get update -y

# 0. 用于跳过命令交互
RUN apt-get install -y expect

# 1. C/C++ compiler
#    检查命令: g++ -v
#    已在基础镜像，无需安装

# 2. Perl
#    检查命令: perl -v | grep perl
RUN apt-get install -y perl

# 3. Perl module: Time::HiRes
#    检查命令: perl -e 'use Time::HiRes;'
RUN apt-get install -y libtime-hires-perl

# 4. Perl module: Compress::Zlib
#    检查命令: perl -e 'use Compress::Zlib;'
RUN apt-get install -y libcompress-zlib-perl

# 5. GNU readline
#    检查命令: gcc -c /root/readlinetest.c
ADD ./volumes/readlinetest.c /root/readlinetest.c
RUN apt-get install -y libreadline-dev

# 6. Python2
#    检查命令: echo 'print "Python is installed"' | python
#    基础镜像已有 Python3，非必要无需换 Python2
# RUN apt-get install -y python2
# RUN rm -f /usr/bin/python && \
#     ln -s /usr/bin/python2 /usr/bin/python
# RUN curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py
# RUN python get-pip.py

# 7. Curl development libraries
#    检查命令: curl-config --version
#    搜索当前系统下的最新版本: apt-cache search libcurl
RUN apt-get install -y libcurl4-openssl-dev



# -----------------------------------------------------
# 下载 openkore
# -----------------------------------------------------
ARG APP_DIR="/app"
ARG OPENKORE_NAME="openkore"
ARG OPENKORE_DIR="${APP_DIR}/${OPENKORE_NAME}"
# 方法一: git 下载仓库（海外网络不好可能会失败）
RUN git config --global http.postBuffer 524288000 && \
    git config --global http.lowSpeedLimit 0 && \
    git config --global http.lowSpeedTime 999999
RUN mkdir -p ${APP_DIR}
RUN cd ${APP_DIR} && \
    git clone --depth 1 --branch master https://github.com/Casual-Ragnarok/openkore
# -----------------------------------------------------
# 方法二: http 下载 zip 仓库
# RUN cd ${APP_DIR} && \
#     wget https://codeload.github.com/Casual-Ragnarok/openkore/zip/refs/heads/master -O ${OPENKORE_NAME}.zip && \
#     unzip ${OPENKORE_NAME}.zip && \
#     rm -f ${OPENKORE_NAME}.zip && \
#     mv ${OPENKORE_NAME}-master ${OPENKORE_NAME}
# -----------------------------------------------------
# 方法三：直接从本地克隆
# COPY ./openkore ${OPENKORE_DIR}
# -----------------------------------------------------



# -----------------------------------------------------
# 编译 openkore
# -----------------------------------------------------
ADD ./volumes/compile.exp ${OPENKORE_DIR}/compile.exp
RUN cd ${OPENKORE_DIR} && \ 
    chmod a+x compile.exp && \ 
    ./compile.exp


WORKDIR ${OPENKORE_DIR}
ADD ./volumes/bin /bin
RUN chmod 100 /bin/.docker-entrypoint.sh && \
    chmod 100 /bin/.wrapper.sh
ENTRYPOINT [ "/bin/.wrapper.sh" ]
