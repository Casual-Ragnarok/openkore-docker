# Powershell
#------------------------------------------------
# ���� docker ����������Ҫʵʱ���������� IP����Ҫ����ԱȨ��ִ�У�
# bin/run.ps1
#           [-p ${PROTOCOL}]            # ҳ��ʹ�� http/https Э�飨Ĭ�� http��
#           [-d ${DOMAIN}]              # �Թ�������������������ʵ�ַ��
#           [-i ${IP}]                  # ������ IP��Ĭ��ͨ������ȡ���� IP�������Ҫ�������ʣ�������Ϊ���� IP��
#           [-k ${OPENAI_API_KEY}]      # ChatGPT API key
#           [-m ${OPENAI_MODEL}]        # ChatGPT Model: gpt-4, gpt-4-0314, gpt-4-0613, gpt-4-32k, gpt-4-32k-0314, gpt-4-32k-0613, gpt-3.5-turbo-16k, gpt-3.5-turbo-16k-0613, gpt-3.5-turbo, gpt-3.5-turbo-0301, gpt-3.5-turbo-0613, text-davinci-003, text-davinci-002, code-davinci-002
#           [-s ${SOCKS_PROXY_HOST}]    # Socks5 ������񣬺� HTTP ��ѡһ����ʽ���� host.docker.internal
#           [-r ${SOCKS_PROXY_PORT}]    # Socks5 �������˿�
#           [-h ${HTTPS_PROXY}]         # HTTP ������񣬺� Socks5 ��ѡһ����ʽ���� http://host.docker.internal:10088
#------------------------------------------------
# ע�� host.docker.internal �� docker �ڷ����������ϵķ���Ĺ̶���ַ
#------------------------------------------------


docker-compose up -d
docker ps
