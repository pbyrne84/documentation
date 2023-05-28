FROM ubuntu:22.04
SHELL ["/bin/bash", "-c"]
RUN apt-get update -y
RUN apt install -y hugo git curl net-tools
RUN mkdir /root/site \
    && cd  /root/site \
    && hugo new site documentation \
    && git init \
    && git submodule add https://github.com/theNewDynamic/gohugo-theme-ananke themes/ananke \
    && echo "theme = 'ananke'" >> config.toml
RUN cd /root/site && hugo server &


#  docker inspect --format ‘{{ .NetworkSettings.IPAddress }}’ 48001a918021
# when in