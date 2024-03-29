% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/export.r
\name{export}
\alias{export}
\title{Explicitly declare module exports}
\usage{
\special{box::export(\dots)}
}
\arguments{
\item{\dots}{zero or more unquoted names that should be exported from the
module.}
}
\value{
\code{box::export} has no return value. It is called for its
side effect.
}
\description{
\code{box::export} explicitly marks a source file as a \pkg{box} module. If
can be used as an alternative to the \code{@export} tag comment to declare a
module’s exports.
}
\details{
\code{box::export} can be called inside a module to specify the module’s
exports. If a module contains a call to \code{box::export}, this call
overrides any declarations made via the \code{@export} tag comment. When a
module contains multiple calls to \code{box::export}, the union of all thus
defined names is exported.

A module can also contain an argument-less call to \code{box::export}. This
ensures that the module does not export any names. Otherwise, a module that
defines names but does not mark them as exported would be treated as a
\emph{legacy module}, and all default-visible names would be exported from
it. Default-visible names are names not starting with a dot (\code{.}).
Another use of \code{box::export()} is to enable a module without exports to
use \link[=mod-hooks]{module event hooks}.
}
\note{
The preferred way of declaring exports is via the \code{@export} tag
comment. The main purpose of \code{box::export} is to explicitly prevent
exports, by being called without arguments.
}
\seealso{
\code{\link[=use]{box::use}} for information on declaring exports via
\code{@export}.
}
