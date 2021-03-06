% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/help.r
\name{parse_documentation}
\alias{parse_documentation}
\alias{parse_roxygen_tags}
\alias{patch_mod_doc}
\title{Parse a module’s documentation}
\usage{
parse_documentation(info, mod_ns)

parse_roxygen_tags(info, mod_ns)

patch_mod_doc(docs)
}
\arguments{
\item{info}{The module info.}

\item{mod_ns}{The module namespace.}

\item{docs}{the list of \pkg{roxygen2} documentation objects.}
}
\value{
\code{parse_documentation} returns a list of character strings with
the Rd documentation source code for each documented name in a module.
}
\description{
Parse a module’s documentation
}
\keyword{internal}
