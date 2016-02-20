FROM gliderlabs/alpine:3.3

MAINTAINER blacktop, https://github.com/blacktop

COPY . /go/src/github.com/maliceio/malice-totalhash
RUN apk-install -t build-deps go git mercurial \
  && set -x \
  && echo "Building info Go binary..." \
  && cd /go/src/github.com/maliceio/malice-totalhash \
  && export GOPATH=/go \
  && go version \
  && go get \
  && go build -ldflags "-X main.Version=$(cat VERSION) -X main.BuildTime=$(date -u +%Y%m%d)" -o /bin/totalhash \
  && rm -rf /go \
  && apk del --purge build-deps

WORKDIR /malware

ENTRYPOINT ["/bin/totalhash"]

CMD ["--help"]
