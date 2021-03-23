FROM rocker/r-ver:4.0.1
RUN apt-get update && apt-get install -y  git-core libcurl4-openssl-dev libgit2-dev libicu-dev libssl-dev libxml2-dev make pandoc pandoc-citeproc && rm -rf /var/lib/apt/lists/*
RUN echo "options(repos = c(CRAN = 'https://cran.rstudio.com/'), download.file.method = 'libcurl', Ncpus = 4)" >> /usr/local/lib/R/etc/Rprofile.site
RUN R -e 'install.packages("remotes")'
RUN Rscript -e 'remotes::install_version("shiny",upgrade="never", version = "1.6.0")'
RUN Rscript -e 'remotes::install_version("config",upgrade="never", version = "0.3.1")'
RUN Rscript -e 'remotes::install_github("r-lib/fastmap@52134c4f568d0407714b55d2d3533dbd71736e2f")'
RUN Rscript -e 'remotes::install_github("r-lib/lifecycle@6c98892fbefe240127b43b44d45b8bedacb2b5fc")'
RUN Rscript -e 'remotes::install_github("r-lib/cachem@8af39cf9470818310659ed1567859dc6421638ca")'
RUN Rscript -e 'remotes::install_github("colinfay/brochure@33a1c2fe59e5ec43cb800bc0864eb388638eefd9")'
RUN Rscript -e 'remotes::install_github("ThinkR-open/golem@1e575ba757e4d3773a894f96ec0deab2a45dad1d")'
RUN mkdir /build_zone
ADD . /build_zone
WORKDIR /build_zone
RUN R -e 'remotes::install_local(upgrade="never")'
RUN rm -rf /build_zone
EXPOSE 80
CMD R -e "options('shiny.port'=80,shiny.host='0.0.0.0');golembrochure::run_app()"
