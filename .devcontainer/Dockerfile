FROM mcr.microsoft.com/devcontainers/base:ubuntu
ARG RGBDS_VERSION=0.6.1
RUN apt-get update && \
   apt-get install -y git cmake gcc build-essential bison libpng-dev pkg-config make && \
   git clone --depth 1 --branch v${RGBDS_VERSION} https://github.com/gbdev/rgbds.git /tmp/rgbds && \
   cmake -B /tmp/rgbds_build -S /tmp/rgbds -DCMAKE_BUILD_TYPE=MinSizeRel && \
   cmake --build /tmp/rgbds_build --target install && \
   rm -rf /tmp/rgbds /tmp/rgbds_build && \
   apt-get autoremove -y && \
   apt-get clean -y && \
   rm -rf /var/lib/apt/lists/* && \
   bison --version && \
   make --version && \
   cmake --version