ARG BASE_TAG

FROM quay.io/nexomis/r:${BASE_TAG}

LABEL org.opencontainers.image.title="Docker image for R with nexoverse"
LABEL org.opencontainers.image.authors="Julien FOURET"
LABEL org.opencontainers.image.description="Nexoverse is a list of packages used often at Nexomis"
LABEL org.opencontainers.image.vendor="Nexomis"
LABEL org.opencontainers.image.licenses="Apache-2.0"

COPY install.r requirements.txt /root/

RUN apt-get update && apt-get install -y \
  libcurl4-openssl-dev \
  libssl-dev \
  libxml2-dev \
  && rm -rf /var/lib/apt/lists/*

RUN Rscript /root/install.r /root/requirements.txt

