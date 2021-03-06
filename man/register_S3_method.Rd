% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/S3.r
\name{register_S3_method}
\alias{register_S3_method}
\title{Register S3 methods}
\usage{
register_S3_method(name, class, method)
}
\arguments{
\item{name}{the name of the generic as a character string.}

\item{class}{the class name.}

\item{method}{the method to register.}
}
\value{
\code{register_S3_method} is called for its side-effect.
}
\description{
\code{register_S3_method} makes an S3 method for a given generic and class
known inside a module.
}
\details{
Methods for generics defined in the same module do not need to be
registered explicitly, and indeed \emph{should not} be registered. However,
if the user wants to add a method for a known generic (defined outside the
module, e.g. \code{\link{print}}), then this needs to be made known
explicitly.

See the vignette in \code{vignette('box', 'box')} for more information on
defining S3 methods inside modules.
}
\note{
\strong{Do not} call \code{\link[base]{registerS3method}} inside a
module. Only use \code{register_S3_method}. This is important for the
module’s own book-keeping.
}
