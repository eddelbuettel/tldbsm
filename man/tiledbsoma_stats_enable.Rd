% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RcppExports.R, R/utils-tiledb.R
\name{tiledbsoma_stats_enable}
\alias{tiledbsoma_stats_enable}
\alias{tiledbsoma_stats_disable}
\alias{tiledbsoma_stats_reset}
\alias{tiledbsoma_stats_dump}
\alias{tiledbsoma_stats_show}
\title{TileDB Statistics interface}
\usage{
tiledbsoma_stats_enable()

tiledbsoma_stats_disable()

tiledbsoma_stats_reset()

tiledbsoma_stats_dump()

tiledbsoma_stats_show()
}
\description{
The functions \code{tiledbsoma_stats_enable}, \code{tiledbsoma_stats_disable}, \code{tiledbsoma_stats_reset}
and \code{tiledbsoma_stats_dump} expose the TileDB Core functionality for performance measurements
and statistics.  The first three just turn on, off or reset, the fourth returns a JSON string.
For convenience the function \code{tiledbsoma_stats_show} displays the information on the console.
}
