# rabbitmq-docker

Build:

  1. `docker build -t adsabs/rabbitmq .`
  1. `docker run -d --name rabbitmq -p 5672:5672 -p 15672:15672 adsabs/rabbitmq`

Use:

  1. `docker stop rabbitmq`
  2. `docker start rabbitmq`
