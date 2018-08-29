pkgs <- readLines('requirements.txt', skipNul = TRUE)
pkgs <- pkgs[nchar(pkgs) > 0]
print(pkgs)

for (pkg in pkgs) {
  install.packages(pkg, repos='https://cran.rstudio.com/')
}

