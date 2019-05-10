FROM rocker/shiny
MAINTAINER Leo Lu (leo@leoluyi.tw)

## install R package dependencies (and clean up)
RUN apt-get update && apt-get install -y gnupg2 libssl-dev\
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/ \
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

## install packages from CRAN (and clean up)
WORKDIR /my_app
COPY ./requirements.txt ./requirements.txt
COPY ./install_packages.R ./install_packages.R
RUN Rscript install_packages.R \
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

## install packages from github (and clean up)
RUN Rscript -e "devtools::install_github('rstudio/shinytest','rstudio/webdriver')" \
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

## install phantomjs
RUN Rscript -e "webdriver::install_phantomjs()"
