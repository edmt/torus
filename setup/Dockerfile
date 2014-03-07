# ZeroMQ - 0.0.1

FROM ubuntu:12.04
MAINTAINER Daniel Martínez <eduardodaniel2@gmail.com>

# Upgrades ubuntu packages
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

# Installs wget and compiler tools
RUN apt-get install -y wget build-essential git

# ZeroMQ Source Code
RUN wget http://download.zeromq.org/zeromq-4.0.3.tar.gz
RUN tar xzf zeromq-4.0.3.tar.gz
WORKDIR /zeromq-4.0.3
RUN ./configure && make && make install
RUN ldconfig

# Just for the python server example...
WORKDIR /server
RUN wget -O server.py --no-check-certificate https://gist.githubusercontent.com/edmt/9360534/raw/df65f017559ed2d52e59ffe40576522532f8f474/gistfile1.py
RUN apt-get install -y python-setuptools python-dev
RUN easy_install pyzmq

# Just for the C server example...
RUN git clone https://gist.github.com/9413522.git
RUN gcc -std=gnu99 9413522/server.c -lzmq -o server

EXPOSE 5555
