#' @export
getToken <- function(appname=NULL, key=NULL, secret=NULL){
  endpoint <- httr::oauth_endpoint(request="https://api.fitbit.com/oauth2/token",
                                   authorize="https://www.fitbit.com/oauth2/authorize",
                                   access="https://api.fitbit.com/oauth2/token"
  )
  if(all(is.null(appname), is.null(key), is.null(secret))){
    myapp <- httr::oauth_app(Sys.getenv("FITBIT_APPNAME"),
                               Sys.getenv("FITBIT_API_KEY"),
                               Sys.getenv("FITBIT_CONSUMER_SECRET")
    )
  }else{
    myapp <- httr::oauth_app(appname, key, secret)
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
