\name{survival}
\alias{survival}
\docType{data}
\title{
Patient survival data.
}
\description{
Data set that contains the survival time (in months), survival status and other information of patients.
}
%%\usage{data("survival")}
\format{
  A data frame with 950 observations on the following 5 variables.
  \describe{
    \item{\code{CaseID}}{A vector of character strings}
    \item{\code{OverallSurvivalMonths}}{A numeric vector}
    \item{\code{OverallSurvivalStatus}}{A factor with levels \code{} \code{DECEASED} \code{LIVING}}
    \item{\code{MutationCount}}{A numeric vector}
    \item{\code{FractionOfCopyNumberAlteredGenome}}{A numeric vector}
  }
}
\source{
Data were downloaded from \url{http://www.cbioportal.org/}.
}
\references{
Data were described and analyzed in Wang, X., Fu, A. Q., McNerney, M. and White, K. P. (2014). Widespread genetic epistasis among breast cancer genes. Nature Communications. 5 4828. doi: 10.1038/ncomms5828.
}
\examples{
data(survival)
}
\keyword{datasets}
