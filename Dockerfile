FROM ubuntu:latest

# Reduce output from debconf
#ENV DEBIAN_FRONTEND noninteractive
#ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN echo "deb http://www.rabbitmq.com/debian/ testing main" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y wget
RUN wget http://www.rabbitmq.com/rabbitmq-signing-key-public.asc -O /tmp/rabbitmq-signing-key-public.asc
RUN apt-key add /tmp/rabbitmq-signing-key-public.asc
RUN apt-get update

## Docker work around for upstart: [https://github.com/dotcloud/docker/issues/1024]
#RUN dpkg-divert --local --rename --add /sbin/initctl
#RUN ln -s /bin/true /sbin/initctl

RUN apt-get install -y rabbitmq-server
RUN rabbitmq-plugins enable rabbitmq_management

ADD rabbitmq.config /etc/rabbitmq/rabbitmq.config

# For RabbitMQ and RabbitMQ Adminm
EXPOSE 5672 15672

USER rabbitmq
ENTRYPOINT ["/usr/sbin/rabbitmq-server"]
