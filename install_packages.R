pkgs <- readLines('requirements.txt', skipNul = TRUE)
pkgs <- pkgs[nchar(pkgs) > 0]

pkg_new <- pkgs[!(pkgs %in% installed.packages()[,"Package"])]

if(length(pkg_new)) {
  install.packages(pkg_new, repos='https://cran.rstudio.com/')
}

rm(pkg_new, pkgs)
