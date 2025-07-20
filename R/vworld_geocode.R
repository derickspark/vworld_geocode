#' VWorld 단일 주소 지오코딩
#' @export
vworld_geocode <- function(address, api_key) {
  url <- "https://api.vworld.kr/req/address"
  params <- list(
    service = "address",
    request = "getcoord",
    version = "2.0",
    address = address,
    refine = "true",
    simple = "false",
    format = "json",
    type = "road",
    key = api_key
  )
  full_url <- paste0(
    url, "?service=", params$service,
    "&request=", params$request,
    "&version=", params$version,
    "&address=", RCurl::curlEscape(params$address),
    "&refine=", params$refine,
    "&simple=", params$simple,
    "&format=", params$format,
    "&type=", params$type,
    "&key=", params$key
  )
  response <- httr::GET(full_url)
  if (httr::http_status(response)$category == "Success") {
    content <- jsonlite::fromJSON(httr::content(response, "text", encoding = "UTF-8"))
    if (content$response$status == "OK") {
      coords <- content$response$result$point
      return(data.frame(
        address = address,
        lat = as.numeric(coords$y),
        lon = as.numeric(coords$x),
        status = "success"
      ))
    } else {
      return(data.frame(
        address = address,
        lat = NA,
        lon = NA,
        status = paste("failed:", content$response$status)
      ))
    }
  } else {
    return(data.frame(
      address = address,
      lat = NA,
      lon = NA,
      status = paste("failed: HTTP", httr::http_status(response)$reason)
    ))
  }
}
