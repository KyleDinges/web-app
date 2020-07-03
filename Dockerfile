FROM industry-analysis

EXPOSE 5000

RUN apt-get update && apt-get -y install \
    gcc

ADD requirements.txt /
RUN pip install -r /requirements.txt

ADD /pypi_org /opt/project
ADD docker-entrypoint.sh /opt/project/docker-entrypoint.sh
RUN chmod +x /opt/project/docker-entrypoint.sh
WORKDIR /opt/project

ENTRYPOINT ["/workspace/docker-entrypoint.sh"]