[![Build Status](https://travis-ci.org/leoluyi/markets_shiny.svg?branch=master)](https://travis-ci.org/leoluyi/markets_shiny)

Testing a Shiny App
===================

This repo contains an example Shiny Dashboard about USA trade data. The
main focus of this project is to show a minimum working example of Shiny
App development using Docker, Travis CI and shinytest.

1. Starting with the rocker/shiny image.
2. Add everything else our application requires; finishing with copying the contents of our app to /srv/shiny-server/usa-trade/, where the dashboard will be served from.

## Testing shiny apps using `shinytest`

```r
devtools::install_github("rstudio/shinytest")
library(shinytest)

recordTest("path/to/app")
```

## Reference

http://tamaszilagyi.com/blog/2018/2018-01-16-shiny_docker/

