ARG R_VERSION
ARG BIOC_VERSION

FROM ghcr.io/nexomis/r:${R_VERSION:-4.3.3}-Bioc_${BIOC_VERSION:-3.18}

COPY install_cran.r /root/install_cran.r
COPY install_bioc.r /root/install_bioc.r
COPY nexoverse.cran.txt /root/nexoverse.cran.txt
COPY nexoverse.bioc.txt /root/nexoverse.bioc.txt

RUN Rscript /root/install_cran.r /root/nexoverse.cran.txt
RUN Rscript /root/install_bioc.r /root/nexoverse.bioc.txt

