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
          'mosaicData', \
          'skimr', \
          'plm', \
          'car', \
          'ggcorrplot', \
          'GGally', \
          'ggrepel', \
          'OCSdata', \
          'viridis', \
          'scales', \
          'srvyr'), repos='http://cran.rstudio.com/')"

USER $NB_USER
