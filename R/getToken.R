#' @export
getToken <- function(key=NULL, secret=NULL){
  endpoint <- httr::oauth_endpoint(request="https://api.fitbit.com/oauth2/token",
                                   authorize="https://www.fitbit.com/oauth2/authorize",
                                   access="https://api.fitbit.com/oauth2/token"
  )
  if(all(is.null(key), is.null(secret))){
    myapp <- httr::oauth_app("myapp",
                               Sys.getenv("FITBIT_API_KEY"),
                               Sys.getenv("FITBIT_CONSUMER_SECRET")
    )
  }else{
    myapp <- httr::oauth_app("myapp", key, secret)
  }
  scope <- c("sleep",
             "activity",
             "heartrate",
             "location",
             "nutrition",
             "profile",
             "settings",
             "social",
             "weight")
  token <- httr::oauth2.0_token(endpoint, myapp,
                                scope = scope, use_basic_auth = TRUE)
}

