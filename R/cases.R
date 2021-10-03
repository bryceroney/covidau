#' Load the daily cases for a set of states
#'
#' @param states a character vector of states to load data for
#' @import rvest
#' @importFrom rlang .data
#'
#' @examples
#' data <- cases(c('ACT', 'NSW'))
#' head(data)
#'
#' @export
cases <- function(states) {
  purrr::map_dfr(states, load_cases_state)
}

load_cases_state <- function(state) {
  path <- paste0("/report/daily-cases/", tolower(state))

  covidlive(path) %>%
    html_element("table.DAILY-CASES") %>%
    html_table() %>%
    janitor::clean_names() %>%
    dplyr::filter(.data$net != "-" & .data$new != "-") %>%
    dplyr::mutate(date = lubridate::dmy(date)) %>%
    dplyr::mutate(dplyr::across(c(.data$new, .data$cases, .data$var, .data$net),
                                ~ as.numeric(gsub(",", "", .x)))) %>%
    dplyr::mutate(state = toupper(state))
}
