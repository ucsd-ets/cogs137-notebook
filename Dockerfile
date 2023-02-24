FROM ucsdets/datascience-rstudio:2021.3-stable

USER root

RUN conda install -c conda-forge r-magick r-tesseract r-pdftools
RUN R -e "install.packages( \
        c('tufte', \
          'datasauRus', \
          'blogdown', \
          'gridExtra', \
          'cowplot', \
          'openintro', \
          'mosaicData'), repos='http://cran.rstudio.com/')"

# The following `update` command was added while debugging a user's problem that nobody could reproduce,
# but the resulting image was never published - so it has not proven to be necessary (and could be detrimental,
# given that its effects are untested). Additionally, it adds ~40 minutes to the build time.
# So, I am commenting this out, but leaving it here for referencee
# ~~ Matthew Fedder, 2023-02-23
# RUN R -e "update.packages(repos='http://cran.rstudio.com/')"

USER $NB_USER
