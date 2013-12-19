FROM ubuntu:latest
MAINTAINER Sidart Kurias
# dind specifics copied from MAINTAINER jerome.petazzoni@dotcloud.com
# make sure the package repository is up to date
RUN echo deb http://archive.ubuntu.com/ubuntu precise universe > /etc/apt/sources.list.d/universe.list
RUN apt-get update -qq
RUN apt-get install -qqy iptables ca-certificates lxc make git wget mercurial curl
# This will use the latest public release. To use your own, comment it out...
#ADD https://get.docker.io/builds/Linux/x86_64/docker-latest /usr/local/bin/docker
# ...then uncomment the following line, and copy your docker binary to current dir.
ADD ./docker /usr/local/bin/docker
ADD ./godeb /usr/local/bin/godeb
ADD ./wrapdocker /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/docker /usr/local/bin/wrapdocker
RUN /usr/local/bin/godeb install 1.2
VOLUME /var/lib/docker
ENV GOPATH /root/flynn/
CMD wrapdocker
