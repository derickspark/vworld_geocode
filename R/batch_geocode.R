#' 여러 주소를 VWorld API로 일괄 지오코딩
#' @param addresses 주소 벡터
#' @param api_key VWorld API 키
#' @return 데이터프레임(address, lat, lon, status)
#' @export
batch_geocode <- function(addresses, api_key) {
  total <- length(addresses)
  pb <- progress::progress_bar$new(
    format = "Processing :current/:total [:bar] :percent ETA: :eta",
    total = total,
    width = 60
  )
  results <- data.frame(address = character(), lat = numeric(), lon = numeric(), status = character())
  for (i in 1:total) {
    pb$tick()
    result <- vworld_geocode(addresses[i], api_key)
    results <- rbind(results, result)
  }
  return(results)
}
