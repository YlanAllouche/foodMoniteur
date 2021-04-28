FROM rocker/tidyverse
RUN install2.r openxlsx knitr markdown plumber kableExtra esquisse plotly flexdashboard shinydashboard
COPY * /app/
RUN mkdir /data
CMD Rscript /app/run.R

