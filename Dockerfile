FROM logstash:5.2.2-alpine
MAINTAINER Evin Callahan <gaieges@gmail.com>

# Copy build files to container root
ADD . /app

# Add any other plugins you need here
RUN logstash-plugin install logstash-output-gelf

# Start logstash
CMD /app/entrypoint.sh
