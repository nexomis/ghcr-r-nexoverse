FROM ghcr.io/nexomis/r:4.3.3-Bioc_3.18-06.2024

LABEL org.opencontainers.image.title="Docker image for R with nexoverse"
LABEL org.opencontainers.image.authors="Julien FOURET"
LABEL org.opencontainers.image.description="Nexoverse is a list of packages used often at Nexomis"
LABEL org.opencontainers.image.vendor="Nexomis"
LABEL org.opencontainers.image.licenses="Apache-2.0"

COPY install_cran.r install_bioc.r nexoverse.cran.txt nexoverse.bioc.txt  /root/

RUN Rscript /root/install_cran.r /root/nexoverse.cran.txt \
  && Rscript /root/install_bioc.r /root/nexoverse.bioc.txt
