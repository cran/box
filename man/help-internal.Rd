% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/help.r
\name{help-internal}
\alias{help-internal}
\alias{help_topic_target}
\alias{find_env}
\alias{call_help}
\title{Helper functions for the help functionality}
\usage{
help_topic_target(topic, caller)

find_env(name, caller)

call_help(call, caller)
}
\arguments{
\item{topic}{the unevaluated expression passed to \code{help}.}

\item{caller}{the environment from which \code{help} was called.}

\item{name}{the name to look for.}

\item{call}{the patched \code{help} call expression.}
}
\value{
\code{help_topic_target} returns a list of two elements containing
the innermost module of the \code{help} call, as well as the name of the
object that’s the subject of the \code{help} call. For \code{help(a$b$c$d)},
it returns \code{list(c, quote(d))}.
}
\description{
\code{help_topic_target} parses the expression being passed to the
\code{help} function call to find the innermost module subset expression in
it.
\code{find_env} acts similarly to \code{\link[utils]{find}}, except that it
looks in the current environment’s parents rather than in the global
environment search list, it returns only one hit (or zero), and it returns
the environment rather than a character string.
\code{call_help} invokes a \code{help()} call expression for a package help
topic, finding the first \code{help} function definition, ignoring the one
from this package.
}
\keyword{internal}
