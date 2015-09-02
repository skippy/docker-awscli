FROM gliderlabs/alpine:3.2
MAINTAINER Adam Greene <adam.greene@gmail.com>

RUN apk add --update \
    py-pip \
    groff \
  && pip install awscli==1.8.1 \
  && rm -rf /var/cache/apk/*

WORKDIR /aws

ENTRYPOINT ["aws"]
