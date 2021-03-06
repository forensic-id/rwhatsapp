% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rwhatsapp.R
\name{rwa_read}
\alias{rwa_read}
\title{Read WhatsApp history into R}
\usage{
rwa_read(txt, tz = NULL, format = NULL, verbose = FALSE, ...)
}
\arguments{
\item{txt}{Path to a txt file of a WhatsApp history or the history itself as
character object.}

\item{tz}{A time zone for date conversion. Set NULL or "" for the default
time zone or a single string with a timezone identifier, see
\link[stringi]{stri_timezone_list}.}

\item{format}{Most formats are automatically detected. If you encounter
problems you can provide a custom format here. Refer to
\link[stringi]{stri_datetime_parse} for guidance.}

\item{verbose}{A logical flag indicating whether information should be
printed to the screen.}

\item{...}{Further arguments passed to \link[stringi]{stri_read_lines}.}
}
\value{
a tibble
}
\description{
The history can be obtained going to the menu in a chat on the WhatsApp app,
choosing "more", then "Export chat".
}
\examples{
history <- system.file("extdata", "sample.txt", package = "rwhatsapp")
df <- rwa_read(history)
}
