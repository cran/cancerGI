\name{computeSurvivalPValueGenePairAll.output}
\alias{computeSurvivalPValueGenePairAll.output}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Survival analysis for pairs of genes (with matched individuals)
}
\description{
This function is similar to \code{computeSurvivalPValueForGenePairSet.output}, except that individuals in \code{data.mut} and \code{data.surv} should match, and that \code{gene.pairs} contains four columns: gene1, mutation type of gene1, gene2, mutation type of gene2.
}
\usage{
computeSurvivalPValueGenePairAll.output(file.out, 
	gene.pairs, data.mut, data.surv, 
	colTime = 2, colStatus = 3, 
	groups = c("All", "Two"), 
	PRINT = FALSE, PRINT.INDEX = FALSE)
}
\arguments{
  \item{file.out}{Output filename.
  }
  \item{gene.pairs}{Matrix of four columns: gene1, mutation type of gene1, gene2, mutation type of gene2.
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
  \item{PRINT.INDEX}{Default is FALSE.  Unused.
  }
}

%- maybe also 'usage' for other objects documented here.
\references{
Wang, X., Fu, A. Q., McNerney, M. and White, K. P. (2014). Widespread genetic epistasis among breast cancer genes. Nature Communications. 5 4828. doi: 10.1038/ncomms5828
}
\author{
Audrey Q. Fu, Xiaoyue Wang
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
Called by \code{\link{computeSurvivalPValueForGenePairSet.output}}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
