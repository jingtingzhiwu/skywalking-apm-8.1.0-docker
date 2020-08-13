FROM java:8
LABEL author=admin@wilkey.vip describe=skywalking_agent_8.1
RUN mkdir /skywalking
COPY ./skywalking.tar.gz /skywalking/
RUN tar -zxvf /skywalking/skywalking.tar.gz
