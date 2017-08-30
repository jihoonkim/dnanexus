### set the base image to Ubuntu
FROM ubuntu:16.04

### File author / maintainer
MAINTAINER Jihoon Kim "j5kim@ucsd.edu"

### change a working directory to /opt
WORKDIR /opt

### update the repository source list and install dependent packages 
RUN apt-get update -y                                                       && \
    apt-get install -y git                                                  && \
    apt-get install -y                                                         \
       curl make python-setuptools python-pip python-virtualenv python-dev     \
       gcc g++ cmake libboost-all-dev libcurl4-openssl-dev zlib1g-dev          \
       libbz2-dev flex bison openssl libssl-dev autoconf                    && \
    git clone https://github.com/dnanexus/dx-toolkit.git                    && \
    cd dx-toolkit                                                           && \
    make                                                                    && \
    pip install --upgrade pip                                               && \
    pip install dxpy && \
    bash environment 
