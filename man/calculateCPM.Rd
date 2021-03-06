% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/calculate-expression.R
\name{calculateCPM}
\alias{calculateCPM}
\title{Calculate counts per million (CPM)}
\usage{
calculateCPM(object, exprs_values = "counts", use_size_factors = TRUE,
  size_factors = NULL)
}
\arguments{
\item{object}{A SingleCellExperiment object or count matrix.}

\item{exprs_values}{A string specifying the assay of \code{object}
containing the count matrix, if \code{object} is a SingleCellExperiment.}

\item{use_size_factors}{a logical scalar specifying whether
the size factors in \code{object} should be used to construct 
effective library sizes.}

\item{size_factors}{A numeric vector containing size factors to 
use for all non-spike-in features.}
}
\value{
Matrix of CPM values.
}
\description{
Calculate count-per-million (CPM) values from the count data.
}
\details{
If requested, size factors are used to define the effective library sizes. 
This is done by scaling all size factors such that the mean scaled size factor is equal to the mean sum of counts across all features. 
The effective library sizes are then used to compute the CPM matrix.

If \code{use_size_factors=TRUE} and \code{object} is a SingleCellExperiment, size factors are automatically extracted from the object.
If \code{use_size_factors=FALSE} or \code{object} is a matrix, the sum of counts for each cell is directly used as the library size.

Note that effective library sizes may be computed differently for features marked as spike-in controls.
This is due to the presence of control-specific size factors in \code{object}. 
See \code{\link{normalizeSCE}} for more details.

If \code{size_factors} is supplied, it will override the any size factors for non-spike-in features in \code{object} (if it is a SingleCellExperiment).
The spike-in size factors will still be used. 
If \code{object} is a matrix, \code{size_factors} will be used instead of the library size.
}
\examples{
data("sc_example_counts")
data("sc_example_cell_info")
example_sce <- SingleCellExperiment(
assays = list(counts = sc_example_counts), colData = sc_example_cell_info)
cpm(example_sce) <- calculateCPM(example_sce, use_size_factors = FALSE)

}
