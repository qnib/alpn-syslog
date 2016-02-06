FROM qnib/alpn-consul

RUN apk update && apk upgrade && \
    apk add rsyslog && \
    # Hmm... how about special config?
    ln -s /etc/init.d/rsyslog /etc/runlevels/default/ && \
    rm -rf /var/cache/apk/*
ADD opt/qnib/rsyslog/bin/configure-targets.sh /opt/qnib/rsyslog/bin/
ADD etc/consul-templates/rsyslog_targets.conf.ctmpl /etc/consul-templates/
ADD etc/rsyslog.conf /etc/
ADD etc/conf.d/rsyslog /etc/conf.d/
ADD etc/consul.d/rsyslog.json /etc/consul.d/
ADD etc/rsyslog.d/file.conf.disabled etc/rsyslog.d/heka.conf.disabled etc/rsyslog.d/kafka.conf.disabled etc/rsyslog.d/logstash.conf.disabled /etc/rsyslog.d/
