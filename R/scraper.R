#' Downloads a URL from COVID Live
#' @keywords internal
covidlive <- function(endpoint) {
  ret <- httr2::request("https://covidlive.com.au") %>%
    httr2::req_url_path_append(endpoint) %>%
    httr2::req_user_agent(
      "covidau package (https://github.com/bryceroney/covidau"
    ) %>%
    httr2::req_perform() %>%
    httr2::resp_body_html()

  return(ret)
}
