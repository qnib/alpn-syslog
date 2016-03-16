FROM qnib/alpn-consul:edge

RUN apk add --update rsyslog \
 && rm -rf /var/cache/apk/*
ADD etc/supervisord.d/rsyslog.ini \
    etc/supervisord.d/rsyslog_conf.ini \
    /etc/supervisord.d/
ADD opt/qnib/rsyslog/bin/configure-targets.sh \
    opt/qnib/rsyslog/bin/start.sh \
    /opt/qnib/rsyslog/bin/
ADD etc/consul-templates/rsyslog_targets.conf.ctmpl /etc/consul-templates/
ADD etc/rsyslog.conf /etc/
ADD etc/conf.d/rsyslog /etc/conf.d/
ADD etc/consul.d/rsyslog.json /etc/consul.d/
ADD etc/rsyslog.d/file.conf.disabled etc/rsyslog.d/heka.conf.disabled etc/rsyslog.d/kafka.conf.disabled etc/rsyslog.d/logstash.conf.disabled /etc/rsyslog.d/
