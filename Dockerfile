FROM daocloud.io/python:2.7
MAINTAINER Huajun Gu <contact@guhuajun.com>

# Make sure python packages are downloaded from Aliyun mirroring.

RUN mkdir -p ~/.pip
RUN touch ~/.pip/pip.conf
RUN echo "[global]" > ~/.pip/pip.conf
RUN echo "index-url = http://mirrors.aliyun.com/pypi/simple/" > ~/.pip/pip.conf
RUN echo "" > ~/.pip/pip.conf
RUN echo "[install]" > ~/.pip/pip.conf
RUN echo "trusted-host=mirrors.aliyun.com" > ~/.pip/pip.conf

RUN mkdir -p /app
WORKDIR /app

ADD requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 8888
ENTRYPOINT ["docker-entrypoint.sh"]
CMD [""]
