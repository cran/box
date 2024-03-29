% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/env.r
\name{name}
\alias{name}
\title{Get a module’s name}
\usage{
\special{box::name()}
}
\value{
\code{box::name} returns a character string containing the name of
the module, or \code{NULL} if called from outside a module.
}
\description{
Get a module’s name
}
\note{
Because this function returns \code{NULL} if not invoked inside a
module, the function can be used to check whether a code is being imported as
a module or called directly.
}
