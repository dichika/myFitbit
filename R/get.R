#' @export

getSleepdata <- function(date, token){
  u <- sprintf("https://api.fitbit.com/1/user/-/sleep/date/%s.json", date)
  res <- httr::GET(url = u,
                   httr::config(token = token))
  dat <- jsonlite::fromJSON(httr::content(res, as = "text"))
  result <- subset(dat$sleep, select = -minuteData)
  return(result)
}

#' @export
getSleepMindata <- function(date, token){
  u <- sprintf("https://api.fitbit.com/1/user/-/sleep/date/%s.json", date)
  res <- httr::GET(url = u,
                   httr::config(token = token))
  dat <- jsonlite::fromJSON(httr::content(res, as = "text"))
  result <- subset(dat$sleep, select = minuteData, drop = TRUE)
  result <- result[[1]]
  return(result)
}

#' @export
getWeightdata <- function(date_start, date_end, token){
  u <- sprintf("https://api.fitbit.com/1/user/-/body/log/weight/date/%s/%s.json",
               date_start, date_end)
  res <- httr::GET(url = u, httr::config(token = token))
  dat <- jsonlite::fromJSON(httr::content(res, as = "text"))
  result <- dat$weight
  return(result)
}
