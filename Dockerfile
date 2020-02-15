FROM ruby:2.7-alpine
LABEL maintainer="sylwek.sokolowski@gmail.com"

ARG BUILD_DATE
ARG BUILD_NAME
ARG BUILD_VERSION
ARG VCS_REF

LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.name=$BUILD_NAME
LABEL org.label-schema.description="Mailcatcher Slydeveloper"
LABEL org.label-schema.url="https://github.com/slydeveloper/mailcatcher"
LABEL org.label-schema.vcs-url="https://github.com/slydeveloper/mailcatcher"
LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.vendor="Sylwester Sokolowski"
LABEL org.label-schema.version=$BUILD_VERSION
LABEL org.label-schema.docker.cmd="docker run --rm -p 1080:1080 slydeveloper/mailcatcher"

ENV MAILCATCHER_VERSION=0.7.1

RUN apk add --update --no-cache \
    build-base \
    sqlite-dev \
    ruby-dev && \
    gem install mailcatcher -v $MAILCATCHER_VERSION && \
    apk del build-base ruby-dev && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/lib/apt/lists/*

EXPOSE 1025 1080

ENTRYPOINT ["mailcatcher", "--foreground", "--ip=0.0.0.0"]