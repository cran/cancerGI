\name{processDataMutSurv}
\alias{processDataMutSurv}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Find matched individuals in mutation and survival data
}
\description{
This functions finds matched individuals in \code{data.mut} and \code{data.surv}, and outputs the two data sets with only matched individuals.
}
\usage{
processDataMutSurv(data.mut, data.surv, colTime = 2, colStatus = 3)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data.mut}{Integer matrix of genes by cases.  The first column contains gene names.  Each of the other columns contains mutation patterns of a case:  0 as wildtype, 1 amplification and -1 deletion.
  }
  \item{data.surv}{Data frame containing case ID, survival time and survival status.  Cases do not need to match those in \code{data.mut}.
  }
  \item{colTime}{Scalar indicating which column in \code{data.surv} contains the survival time.
  }
  \item{colStatus}{A character string indicating which column in \code{data.surv} contains the survival status: "DECEASED" or "LIVING".
  }
}
\value{
A list of two data frames, \code{data.mut} and \code{data.surv}.  Format of the data frames is the same as input, except that the individuals in the two data frames are matched.
}
\references{
Wang, X., Fu, A. Q., McNerney, M. and White, K. P. (2014). Widespread genetic epistasis among breast cancer genes. Nature Communications. 5 4828. doi: 10.1038/ncomms5828
}
\author{
Audrey Q. Fu, Xiaoyue Wang
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{computeSurvivalPValueForGenePairSet.output}}
}
