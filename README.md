# skywalking-apm-8.1.0-docker



# docker-compose run skywalking

```
version: '3.3'
services:
  es:
    image: docker.elastic.co/elasticsearch/elasticsearch:6.7.2
    container_name: es
    restart: always
    ports:
      - 9200:9200
      - 9300:9300
    environment:
      discovery.type: single-node
      TZ: "Asia/Shanghai"
    volumes:
      - /data/esdata/:/usr/share/elasticsearch/data/
      - /docker/config/elasticsearch.yml:/usr/share/elasticsearch/config/elasticsearch.yml
      - /etc/timezone:/etc/timezone:ro
      - /etc/localtime:/etc/localtime:ro
  oap:
    image: apache/skywalking-oap-server:8.1.0-es6
    container_name: oap
    depends_on:
      - es
    links:
      - es
    restart: always
    ports:
      - 11800:11800
      - 12800:12800
    environment: 
      SW_STORAGE: "elasticsearch"
      SW_STORAGE_ES_CLUSTER_NODES: "es:9200"
      TZ: "Asia/Shanghai"
    volumes:
      - /etc/timezone:/etc/timezone:ro
      - /etc/localtime:/etc/localtime:ro
  ui:
    image: apache/skywalking-ui:8.1.0
    container_name: ui
    depends_on:
      - oap
    links:
      - oap
    restart: always
    ports:
      - 8080:8080
    environment:
      SW_OAP_ADDRESS: "oap:12800"
      TZ: "Asia/Shanghai"
    volumes:
      - /etc/timezone:/etc/timezone:ro
      - /etc/localtime:/etc/localtime:ro
```

docker run -p 9301:9301 registry.cn-shenzhen.aliyuncs.com/wilkey/test
