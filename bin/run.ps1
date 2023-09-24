# Powershell
#------------------------------------------------
# 运行 docker 服务（由于需要实时解析局域网 IP，需要管理员权限执行）
# bin/run.ps1
#           [-p ${PROTOCOL}]            # 页面使用 http/https 协议（默认 http）
#           [-d ${DOMAIN}]              # 对公服务域名（浏览器访问地址）
#           [-i ${IP}]                  # 服务器 IP（默认通过网卡取内网 IP，如果需要公网访问，需设置为公网 IP）
#           [-k ${OPENAI_API_KEY}]      # ChatGPT API key
#           [-m ${OPENAI_MODEL}]        # ChatGPT Model: gpt-4, gpt-4-0314, gpt-4-0613, gpt-4-32k, gpt-4-32k-0314, gpt-4-32k-0613, gpt-3.5-turbo-16k, gpt-3.5-turbo-16k-0613, gpt-3.5-turbo, gpt-3.5-turbo-0301, gpt-3.5-turbo-0613, text-davinci-003, text-davinci-002, code-davinci-002
#           [-s ${SOCKS_PROXY_HOST}]    # Socks5 代理服务，和 HTTP 二选一，格式形如 host.docker.internal
#           [-r ${SOCKS_PROXY_PORT}]    # Socks5 代理服务端口
#           [-h ${HTTPS_PROXY}]         # HTTP 代理服务，和 Socks5 二选一，格式形如 http://host.docker.internal:10088
#------------------------------------------------
# 注： host.docker.internal 是 docker 内访问宿主机上的服务的固定地址
#------------------------------------------------


docker-compose up -d
docker ps
