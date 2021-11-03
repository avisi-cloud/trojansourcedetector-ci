FROM centos:8 as build

ARG TROJAN_SOURCE_DETECTOR_VERSION=1.0.1
ARG TROJAN_SOURCE_DETECTOR_SHA256=62dfc2afb37c0124b755dbcee52e5af5cea2da372609cc83a8c2cbb62caf7598

RUN curl -L -O https://github.com/haveyoudebuggedit/trojansourcedetector/releases/download/v${TROJAN_SOURCE_DETECTOR_VERSION}/trojansourcedetector_${TROJAN_SOURCE_DETECTOR_VERSION}_linux_amd64.tar.gz \
    \
    && sha256sum trojansourcedetector_${TROJAN_SOURCE_DETECTOR_VERSION}_linux_amd64.tar.gz \
    && echo "${TROJAN_SOURCE_DETECTOR_SHA256} trojansourcedetector_${TROJAN_SOURCE_DETECTOR_VERSION}_linux_amd64.tar.gz" | sha256sum -c \
    && tar -zxvf trojansourcedetector_${TROJAN_SOURCE_DETECTOR_VERSION}_linux_amd64.tar.gz  \
    \
    && mv trojansourcedetector /usr/local/bin/trojansourcedetector \
    && rm -rf trojansourcedetector_${TROJAN_SOURCE_DETECTOR_VERSION}_linux_amd64.tar.gz

# Resulting image
FROM alpine:3.14.2
WORKDIR /build
COPY --from=build /usr/local/bin/trojansourcedetector /usr/local/bin/trojansourcedetector
ENTRYPOINT [ "/usr/local/bin/trojansourcedetector" ]
