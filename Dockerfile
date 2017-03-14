FROM docker.elastic.co/logstash/logstash:5.2.2
MAINTAINER Evin Callahan <gaieges@gmail.com>

# Copy build files to container root
ADD . /app
ADD logstash.yml /usr/share/logstash/config/logstash.yml

# Start logstash
CMD /app/entrypoint.sh
