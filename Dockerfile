FROM rocker/tidyverse
RUN install2.r openxlsx knitr markdown plumber kableExtra esquisse plotly flexdashboard shinydashboard reshape2
COPY * /app/
RUN mkdir /data
COPY example.xlsx  /data/
CMD Rscript /app/run.R

