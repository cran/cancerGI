\name{mutations}
\alias{mutations}
\docType{data}
\title{
Genetic mutation data in patients.
}
\description{
Data frame that contains mutation patterns in multiple genes across multiple patients.
}
\format{
  A data frame with 85 rows and 951 columns.  Each row is a gene.  The first column contains gene names, and each of the other columns contains the mutation pattern in an individual: 0 for no mutation, 1 amplification and -1 deletion.
}
\references{
Wang, X., Fu, A. Q., McNerney, M. and White, K. P. (2014). Widespread genetic epistasis among breast cancer genes. Nature Communications. 5 4828. doi: 10.1038/ncomms5828.
}
\examples{
data(mutations)
}
\keyword{datasets}
