ARG BASE_TAG=buster-slim
FROM debian:${BASE_TAG} AS base-arm64

ENV RUSTUP_ARCH=aarch64-unknown-linux-gnu

ARG BASE_TAG=buster-slim
FROM debian:${BASE_TAG} AS base-amd64

ENV RUSTUP_ARCH=x86_64-unknown-linux-gnu

ARG BASE_TAG=buster-slim
FROM debian:${BASE_TAG} AS base-386

ENV RUSTUP_ARCH=i686-unknown-linux-gnu

ARG BASE_TAG=buster-slim
FROM debian:${BASE_TAG} AS base-arm

ENV RUSTUP_ARCH=armv7-unknown-linux-gnueabihf

ARG BASE_TAG=buster-slim
FROM debian:${BASE_TAG} AS base-ppc64le

ENV RUSTUP_ARCH=powerpc64le-unknown-linux-gnu

ARG BASE_TAG=buster-slim
FROM debian:${BASE_TAG} AS base-s390x

ENV RUSTUP_ARCH=s390x-unknown-linux-gnu

FROM base-$TARGETARCH

ENV RUSTUP_HOME=/usr/local/rustup \
    CARGO_HOME=/usr/local/cargo \
    PATH=/usr/local/cargo/bin:$PATH

RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates gcc libc6-dev wget \
    && wget "https://static.rust-lang.org/rustup/dist/$RUSTUP_ARCH/rustup-init" \
    && chmod +x /rustup-init \
    && ./rustup-init -y --no-modify-path --default-toolchain nightly --default-host=$RUSTUP_ARCH \
    && rm rustup-init \
    && chmod -R a+w $RUSTUP_HOME $CARGO_HOME \
    && rustup --version \
    && cargo --version \
    && rustc --version \
    && apt-get remove -y --auto-remove wget \
    && rm -rf /var/lib/apt/lists/*
