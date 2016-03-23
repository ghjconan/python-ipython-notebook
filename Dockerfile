FROM daocloud.io/python:2.7
MAINTAINER Huajun Gu <contact@guhuajun.com>

# Make sure python packages are downloaded from Aliyun mirroring.

RUN mkdir -p ~/.pip
RUN cp pip.conf ~/.pip/pip.conf

RUN mkdir -p /app
WORKDIR /app

ADD requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 8888
ENTRYPOINT ["docker-entrypoint.sh"]
CMD [""]
