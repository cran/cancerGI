\name{testMutationalPatternAll.wrapper}
\alias{testMutationalPatternAll.wrapper}
\title{Compute the p and q values of all pairwise gene mutation patterns}
\description{This function computes the p and q values of all pairwise gene mutation patterns.  Patterns include both genes losing their function, one gene gaining function and the other losing function, both genes gaining function, and the two genes being mutually exclusive.
}
\usage{
testMutationalPatternAll.wrapper(data, QVALUE = TRUE, PRINT = FALSE)
}
\arguments{
  \item{data}{Matrix of gene mutations.  Each row is a gene.  The first column contains gene names, and all the other columns each contain mutation values in an individual.  Value 1 corresponds to gain of function, -1 loss of function, and 0 no change.  Missing values are denoted NAs.
  }
  \item{QVALUE}{TRUE if q values are calculated, and FALSE otherwise.
  }
  \item{PRINT}{TRUE if printing intermediate values, and FALSE otherwise.
  }
}
\value{
A list of two matrices, one containing the p values, and the other the q values (if the QVALUE argument set to TRUE).  Each matrix has the following columns: gene 1, gene 2, p (or q) value of the loss & loss, gain & loss, loss & gain, gain & gain, and mutually exclusive combination.
}
\references{
Wang, X., Fu, A. Q., McNerney, M. and White, K. P. (2014). Widespread genetic epistasis among breast cancer genes. Nature Communications. 5 4828. doi: 10.1038/ncomms5828
}
\author{
Audrey Fu, Xiaoyue Wang
}
\examples{
data (mutations)
mut.pqvalues <- testMutationalPatternAll.wrapper (data=mutations, QVALUE=TRUE)
summary (mut.pqvalues)
dim (mut.pqvalues$pvalues)
dim (mut.pqvalues$qvalues)
mut.pqvalues$pvalues[1:10,]
}