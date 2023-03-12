FROM golang:1.20-alpine as build

RUN apk add git

RUN mkdir /build
WORKDIR /build
RUN git clone https://github.com/avisi-cloud/trojansourcedetector.git trojansourcedetector \
    && cd trojansourcedetector \
    && go generate \
    && go test -v ./... \
    && go build -o trojansourcedetector cmd/trojansourcedetector/main.go

# Resulting image
FROM alpine:3.14.2

ARG USER=trojansourcedetector
RUN adduser -D $USER
USER $USER
WORKDIR /build

COPY --from=build /build/trojansourcedetector/trojansourcedetector /usr/local/bin/trojansourcedetector
COPY config.json /home/trojansourcedetector/config.json
ENTRYPOINT [ "/usr/local/bin/trojansourcedetector", "-config=/home/trojansourcedetector/config.json" ]
