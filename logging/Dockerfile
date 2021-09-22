FROM docker.elastic.co/logstash/logstash:6.8.15
RUN rm -f /usr/share/logstash/pipeline/logstash.conf
ADD pipeline/*.conf /usr/share/logstash/pipeline/
ADD config/logstash.yml /usr/share/logstash/config/

