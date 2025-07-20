.onLoad <- function(libname, pkgname) {
  # RCurl 자동 로드
  if (!"RCurl" %in% loadedNamespaces()) {
    library(RCurl, character.only = TRUE)
  }
}
