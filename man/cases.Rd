% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cases.R
\name{cases}
\alias{cases}
\title{Load the daily cases for a set of states}
\usage{
cases(states)
}
\arguments{
\item{states}{a character vector of states to load data for}
}
\description{
Load the daily cases for a set of states
}
\examples{
data <- cases(c("ACT", "NSW"))
head(data)
}
