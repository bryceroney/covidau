#' Load the daily cases for a set of states
#'
#' @param states a character vector of states to load data for
#' @import rvest
#'
#' @examples
#' data <- cases(c('ACT', 'NSW'))
#' head(data)
cases <- function(states) {
  purrr::map_dfr(states, load_cases_state)
}

load_cases_state <- function(state) {
  path <- paste0("/report/daily-cases/", tolower(state))

  covidlive(path) %>%
    html_element("table.DAILY-CASES") %>%
    html_table() %>%
    janitor::clean_names() %>%
    dplyr::filter(net != "-" & new != "-") %>%
    dplyr::mutate(date = lubridate::dmy(date)) %>%
    dplyr::mutate(across(c(new, cases, var, net), ~ as.numeric(gsub(",", "", .x))))
}
