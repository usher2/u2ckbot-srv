FROM golang:1.14-alpine

WORKDIR /go/src/app
RUN addgroup -g 5001 alice \
	&& adduser -D -h /dev/null -G alice -u 5001 -s /sbin/nologin alice \
	&& apk add --no-cache git \
	&& install -d /go/src/app \
        && git clone https://github.com/usher2/u2ckbot.git . \
        && apk del git \
        && go get -d -v ./... \
	&& go install -v ./...
COPY entrypoint.sh /entrypoint.sh
VOLUME /tmp
USER alice

ENTRYPOINT ["/entrypoint.sh"]

