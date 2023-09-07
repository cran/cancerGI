\name{computeSurvivalPValueOneGenePair.output}
\alias{computeSurvivalPValueOneGenePair.output}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Write results from survival analysis to output for one pair of genes
}
\description{
This function is similar to \code{computeSurvivalPValueOneGenePair}, except that it writes the analysis results directly to output file and does not allow for plotting the survival curves.
}
\usage{
computeSurvivalPValueOneGenePair.output(file.out, genes.info, 
	data.mut, data.surv, colTime = 2, colStatus = 3, 
	groups = c("All", "Two"), PRINT = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{file.out}{Output filename.
  }
  \item{genes.info}{
A vector of 6 elements: gene1, mutation type, gene2, mutation type, gene1's column index in \code{data.mut}, gene2's column index in \code{data.mut}.
}
  \item{data.mut}{Integer matrix of genes by cases.  The first column contains gene names.  Each of the other columns contains mutation patterns of a case:  0 as wildtype, 1 amplification and -1 deletion.
  }
  \item{data.surv}{Data frame containing case ID, survival time and survival status.  Cases should match those in \code{data.mut}.
  }
  \item{colTime}{Scalar indicating which column in \code{data.surv} contains the survival time.
  }
  \item{colStatus}{A character string indicating which column in \code{data.surv} contains the survival status: "DECEASED" or "LIVING".
  }
  \item{groups}{"All" if comparing all combinations: wildtype & wildtype, wild type & mutated, both mutated; or "Two", if only comparing single mutation and double mutation.
  }
  \item{PRINT}{Default is FALSE.  Prints intermediate values if set to TRUE.  Output may be massive if the number of gene pairs is large.
  }
}
\value{
A vector of values from the survival analysis, as described in \code{computeSurvivalPValueForGenePairSet.output}}
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
