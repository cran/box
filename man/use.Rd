% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/use.r
\name{use}
\alias{use}
\title{Import a module or package}
\usage{
use(...)
}
\arguments{
\item{...}{one or more module import declarations, see \sQuote{Details} for a
description of the format.}
}
\value{
\code{box::use} has no return value. It is called for its
side-effect.
}
\description{
\code{box::use} imports one or more modules and/or packages, and makes them
available in the calling environment.
}
\details{
\code{box::use(...)} specifies a list of one or more import declarations,
given as individual arguments to \code{box::use}, separated by comma. Each
import declaration takes one of the following forms:

\describe{
\item{\code{\var{prefix}/\var{mod}}:}{
     Import a module given the qualified module name
     \code{\var{prefix}/\var{mod}} and make it available locally using the
     name \code{\var{mod}}. The \code{\var{prefix}} itself can be a nested
     name to allow importing specific submodules. \emph{Local imports} can be
     specified via the prefixes starting with \code{.} and \code{..}, to
     override the search path and use the local path instead. See the
     \sQuote{Search path} below for details.
}
\item{\code{\var{pkg}}:}{
     Import a package \code{\var{pkg}} and make it available locally using its own
     package name.
}
\item{\code{\var{alias} = \var{prefix}/\var{mod}} or \code{\var{alias} = \var{pkg}}:}{
     Import a module or package, and make it available locally using the name
     \code{\var{alias}} instead of its regular module or package name.
}
\item{\code{\var{prefix}/\var{mod}[\var{attach_list}]} or \code{\var{pkg}[\var{attach_list}]}:}{
     Import a module or package and attach the exported symbols listed in
     \code{\var{attach_list}} locally. This declaration does \emph{not} make
     the module/package itself available locally. To override this, provide
     an alias, that is, use \code{\var{alias} =
     \var{prefix}/\var{mod}[\var{attach_list}]} or \code{\var{alias} =
     \var{pkg}[\var{attach_list}]}.

     The \code{\var{attach_list}} is a comma-separated list of names,
     optionally with aliases assigned via \code{alias = name}. The list can
     also contain the special symbol \code{...}, which causes \emph{all}
     exported names of the module/package to be imported.
}
}

See the vignette at \code{vignette('box')} for detailed examples of the
different types of use declarations listed above.
}
\section{Import semantics}{

Modules and packages are loaded into dedicated namespace environments. Names
from a module or package can be selectively attached to the current scope as
shown above.

Unlike with \code{\link[base]{library}}, attaching happens \emph{locally},
i.e. in the caller’s environment: if \code{box::use} is executed in the
global environment, the effect is the same. Otherwise, the effect of
importing and attaching a module or package is limited to the caller’s local
scope (its \code{environment()}). When used \emph{inside a module} at module
scope, the newly imported module is only available inside the module’s scope,
not outside it (nor in other modules which might be loaded).

Member access of (non-attached) exported names of modules and packages
happens via the \code{$} operator. This operator does not perform partial
argument matching, in contrast with the behavior of the \code{$} operator in
base R, which matches partial names.
}

\section{Search path}{

Modules are searched in the module search path, given by
\code{getOption('box.path')}. This is a character vector of paths to search,
from the highest to the lowest priority. The current directory is always
considered last. That is, if a file \file{a/b.r} exists both locally in the
current directory and in a module search path, the local file \file{./a/b.r}
will \emph{not} be loaded, unless the import is explicitly declared as
\code{box::use(./a/b)}.

Given a declaration \code{box::use(a/b)} and a search path \file{\var{p}}, if
the file \file{\var{p}/a/b.r} does not exist, \pkg{box} alternatively looks
for a nested file \file{\var{p}/a/b/__init__r} to load. Module path names are
\emph{case sensitive} (even on case insensitive file systems), but the file
extension can be spelled as either \file{.r} or \file{.R} (if both exist,
\code{.r} is given preference).

The module search path can be overridden by the environment variable
\env{R_BOX_PATH}. If set, it may consist of one or more search paths,
separated by the platform’s path separator (i.e. \code{;} on Windows, and
\code{:} on most other platforms).

The \emph{current directory} is context-dependent: inside a module, the
directory corresponds to the module’s directory. Inside an R code file
invoked from the command line, it corresponds to the directory containing
that file. If the code is running inside a \pkg{Shiny} application or a
\pkg{knitr} document, the directory of the execution is used. Otherwise (e.g.
in an interactive R session), the current working directory as given by
\code{getwd()} is used.

Local import declarations (that is, module prefixes that start with \code{./}
or \code{../}) never use the search path to find the module. Instead,
only the current module’s directory (for \code{./}) or the parent module’s
directory (for \code{../}) is looked at. \code{../} can be nested:
\code{../../} denotes the grandparent module, etc.
}

\section{S3 support}{

Modules can contain S3 generics and methods. To override known generics
(= those defined outside the module), methods inside a module need to be
registered using \code{\link{register_S3_method}}. See the documentation
there for details.
}

\section{Module names}{

A module’s full name consists of one or more R names separated by \code{/}.
Since \code{box::use} declarations contain R expressions, the names need to
be valid R names. Non-syntactic names need to be wrapped in backticks; see
\link[base]{Quotes}.

Furthermore, since module names usually correspond to file or folder names,
they should consist only of valid path name characters to ensure portability.
}

\section{Encoding}{

All module source code files are assumed to be UTF-8 encoded.
}

\examples{
local({
    # Set the module search path for the example module.
    old_opts = options(box.path = system.file(package = 'box'))
    on.exit(options(old_opts))

    # Basic usage
    # The file `box/hello_world.r` exports the functions `world` and `bye`.
    box::use(box/hello_world)
    hello_world$hello('Robert')
    hello_world$bye('Robert')

    # Using an alias
    box::use(world = box/hello_world)
    world$hello('John')

    # Attaching exported names
    box::use(box/hello_world[hello])
    hello('Jenny')
    # Exported but not attached, thus access fails:
    try(bye('Jenny'))

    # Attach everything, give 'world' an alias:
    box::use(box/hello_world[hi = hello, ...])
    hi('Eve')
    bye('Eve')
})
}
\seealso{
\code{\link{name}} and \code{\link{file}} give information about loaded
modules.
\code{\link{help}} displays help for a module’s exported names.
\code{\link{unload}} and \code{\link{reload}} aid during module development
by performing dynamic unloading and reloading of modules in a running R
session.
}
