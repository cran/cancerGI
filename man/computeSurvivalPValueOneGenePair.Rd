\name{computeSurvivalPValueOneGenePair}
\alias{computeSurvivalPValueOneGenePair}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Survival analysis for one pair of genes
}
\description{
This function performs survival analysis, similar to function 
\code{computeSurvivalPValueForGenePairSet.output}, but for one pair of genes.
}
\usage{
computeSurvivalPValueOneGenePair(data.mut, data.surv, 
	colTime = 2, colStatus = 3, 
	type.gene1 = (-1), type.gene2 = (-1), 
	groups = c("All", "Two"), 
	compare = c("Both", "Gene1", "Gene2"), 
	PLOT = FALSE, PRINT = FALSE, 
	pvalue.text.x = 10, pvalue.text.y = 0.1, 
	legend.x = 150, legend.y = 1)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data.mut}{
Integer matrix of individuals by two genes.  Each column containing the mutation patterns of multiple genes: 0 as wildtype, 1 amplification and -1 deletion.  
}
  \item{data.surv}{Data frame containing case ID, survival time and survival status.  Cases should match those in \code{data.mut}.
}
  \item{colTime}{Scalar indicating which column in \code{data.surv} contains the survival time.
  }
  \item{colStatus}{A character string indicating which column in \code{data.surv} contains the survival status: "DECEASED" or "LIVING".
  }
  \item{type.gene1}{Integer indicating the type of mutation: 0 for wild type, 1 for amplification, and -1 for deletion.
  }
  \item{type.gene2}{Same as \code{type.gene1}, but for the second gene.
  }
  \item{groups}{"All" if comparing all combinations: wildtype & wildtype, wild type & mutated, both mutated; or "Two", if only comparing single mutation and double mutation.
  }
  \item{compare}{"Both" if comparing all four combinations: wildtype & wildtype, wildtype & mutated, mutated & wildtype, and mutated & mutated.  "Gene1" if comparing three combinations: gene1 wildtype, gene1 mutated & gene2 wildtype, and both mutated.  "Gene2" is similar to "Gene1".
}
  \item{PLOT}{
If TRUE, plot the survival curves and print the p value onto the plot.  Location of the p value legend is controlled by \code{pvalue.text.x} and \code{pvalue.text.y} described below.
}
  \item{PRINT}{
If TRUE, print intermediate values.
}
  \item{pvalue.text.x}{
The x coordinate of the p value legend in plot.
}
  \item{pvalue.text.y}{
The y coordinate of the p value legend in plot.
}
  \item{legend.x}{
The x coordinate of the curve legend in plot.
}
  \item{legend.y}{
The y coordinate of the curve legend in plot.
}
}
\value{
The output contains the same info as described in \code{computeSurvivalPValueForGenePairSet.output}.
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

