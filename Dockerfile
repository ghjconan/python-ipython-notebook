FROM daocloud.io/python:2.7
MAINTAINER Huajun Gu <contact@guhuajun.com>

RUN mkdir -p /app
WORKDIR /app

# Make sure that python packages should be downloaded from Aliyun mirroring site.
RUN mkdir -p ~/.pip
ADD pip.conf ~/.pip/pip.conf

ADD requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 8888
ENTRYPOINT ["docker-entrypoint.sh"]
CMD [""]
