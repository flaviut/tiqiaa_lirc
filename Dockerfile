ARG DISTRO=debian:bookworm
FROM $DISTRO

RUN apt-get update && apt-get install -y \
    build-essential \
    debhelper \
    pkg-config \
    liblirc-dev \
    libusb-1.0-0-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /build/sources
COPY . .

RUN dpkg-buildpackage -us -uc -b && \
  mkdir -p /build/build && \
  mv ../*.deb /build/build/
