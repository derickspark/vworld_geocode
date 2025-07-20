.onAttach <- function(libname, pkgname) {
  # RCurl을 강제로 로드 (패키지 attach 시 실행)
  if (!"RCurl" %in% loadedNamespaces()) {
    requireNamespace("RCurl", quietly = TRUE)
    library(RCurl, character.only = TRUE)
  }
}
