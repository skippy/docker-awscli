FROM debian:wheezy
MAINTAINER Adam Greene <adam.greene@gmail.com>

RUN	apt-get update && \
    apt-get install -y python-pip groff-base && \
    apt-get clean && \
	rm -rf /var/lib/apt/lists/*

RUN pip install awscli==1.8.1

WORKDIR /aws

ENTRYPOINT ["aws"]