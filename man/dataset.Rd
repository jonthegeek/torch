% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils-data.R
\name{dataset}
\alias{dataset}
\title{Helper function to create an function that generates R6 instances of class \code{dataset}}
\usage{
dataset(
  name = NULL,
  inherit = Dataset,
  ...,
  private = NULL,
  active = NULL,
  parent_env = parent.frame()
)
}
\arguments{
\item{name}{a name for the dataset. It it's also used as the class
for it.}

\item{inherit}{you can optionally inherit from a dataset when creating a
new dataset.}

\item{...}{public methods for the dataset class}

\item{private}{passed to \code{\link[R6:R6Class]{R6::R6Class()}}.}

\item{active}{passed to \code{\link[R6:R6Class]{R6::R6Class()}}.}

\item{parent_env}{An environment to use as the parent of newly-created
objects.}
}
\value{
The output is a function \code{f} with class \code{dataset_generator}. Calling \code{f()}
creates a new instance of the R6 class \code{dataset}. The R6 class is stored in the
enclosing environment of \code{f} and can also be accessed through \code{f}s attribute
\code{Dataset}.
}
\description{
All datasets that represent a map from keys to data samples should subclass this
class. All subclasses should overwrite the \code{.getitem()} method, which supports
fetching a data sample for a given key. Subclasses could also optionally
overwrite \code{.length()}, which is expected to return the size of the dataset
(e.g. number of samples) used by many sampler implementations
and the default options of \code{\link[=dataloader]{dataloader()}}.
}
\note{
\code{\link[=dataloader]{dataloader()}}  by default constructs a index
sampler that yields integral indices.  To make it work with a map-style
dataset with non-integral indices/keys, a custom sampler must be provided.
}
\section{Get a batch of observations}{


By default datasets are iterated by returning each observation/item individually.
Often it's possible to have an optimized implementation to take a batch
of observations (eg, subsetting a tensor by multiple indexes at once is faster than
subsetting once for each index), in this case you can implement a \code{.getbatch} method
that will be used instead of \code{.getitem} when getting a batch of observations within
the dataloader. \code{.getbatch} must work for batches of size larger or equal to 1. For more
on this see the the \code{vignette("loading-data")}.
}

