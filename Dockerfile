FROM ghcr.io/nexomis/r:4.4.1-bioc_3.19-07.2024

LABEL org.opencontainers.image.title="Docker image for R with nexoverse"
LABEL org.opencontainers.image.authors="Julien FOURET"
LABEL org.opencontainers.image.description="Nexoverse is a list of packages used often at Nexomis"
LABEL org.opencontainers.image.vendor="Nexomis"
LABEL org.opencontainers.image.licenses="Apache-2.0"

COPY install.r nexoverse.cran.txt nexoverse.bioc.txt  /root/

RUN Rscript /root/install.r cran /root/nexoverse.cran.txt \
  && Rscript /root/install.r bioc /root/nexoverse.bioc.txt
