FROM alpine:latest AS build

ARG BASTILLION_VERSION
ARG BASTILLION_FILENAME_VERSION

ENV BASTILLION_VERSION="${BASTILLION_VERSION}"
ENV BASTILLION_FILENAME_VERSION="${BASTILLION_FILENAME_VERSION}"

ENV BASTILLION_VERSION=3.14.0
ENV BASTILLION_FILENAME_VERSION=3.14_00

RUN apk add --no-cache wget tar \
  && wget --quiet https://github.com/bastillion-io/Bastillion/releases/download/v${BASTILLION_VERSION}/bastillion-jetty-v${BASTILLION_FILENAME_VERSION}.tar.gz -O - | tar xz -C /opt \
  && mv /opt/Bastillion-jetty /opt/bastillion \
  && mkdir -p /opt/bastillion/jetty/bastillion/WEB-INF/classes/keydb \ 
  && chown -R 1042:1042 /opt/bastillion && chmod -R 766 /opt/bastillion

WORKDIR /opt/bastillion

COPY files/BastillionConfig.properties.tpl /opt/bastillion/jetty/bastillion/WEB-INF/classes/BastillionConfig.properties
COPY files/jetty-start.ini /opt/bastillion/jetty/start.ini
COPY files/startBastillion.sh /opt/bastillion/

RUN chmod 750 /opt/bastillion/startBastillion.sh \
  && chown 1042:1042 /opt/bastillion/startBastillion.sh \
  && chown 1042:1042 /opt/bastillion/jetty/bastillion/WEB-INF/classes/BastillionConfig.properties 

# Runtime stage for arm64
FROM --platform=$TARGETPLATFORM alpine:latest

RUN apk add --no-cache --update openjdk11-jre curl openssh-keygen

COPY --from=build /opt/bastillion /opt/bastillion
WORKDIR /opt/bastillion

RUN addgroup -g 1042 1042 && adduser 1042 -u 1042 -G 1042 -D

USER 1042

ENTRYPOINT ["./startBastillion.sh"]
