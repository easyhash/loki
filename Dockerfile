FROM ubuntu:xenial

# Get needed packages
RUN set -x \
	&& buildDeps=' \
		ca-certificates \
		cmake \
		g++ \
		git \
		libboost-all-dev \
		libssl-dev \
		make \
		pkg-config \
		build-essential \
		libzmq3-dev \
		wget \
		libdb-dev \
		graphviz \
		doxygen \
		curl \
		libtool-bin \
		autoconf \
		automake \
		unzip'\
	&& apt-get -qq update \
	&& apt-get -qq install $buildDeps

# Create app directory
RUN mkdir -p /daemon && mkdir -p /daemon/data && mkdir -p /daemon

# Install Daemon
WORKDIR /daemon/
RUN wget https://github.com/loki-project/loki/releases/download/v1.0.0-rc.3/loki-linux-x64-1.0.0-rc.3.zip
RUN unzip loki-linux-x64-1.0.0-rc.3.zip && chmod +x loki-linux-x64-*/loki* && mv -f loki-linux-x64-*/* . 

EXPOSE 18081 18082

WORKDIR /daemon/