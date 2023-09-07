\name{computeSurvivalPValueForGenePairSet.output}
\alias{computeSurvivalPValueForGenePairSet.output}
\title{Survival analysis for pairs of genes}
\description{This function counts the number of individuals with different mutation patterns, estimates the median survival time for each mutation pattern, and computes the p values.
}
\usage{
computeSurvivalPValueForGenePairSet.output(file.out, 
	gene.pairs, data.mut, data.surv, 
	colTime = 2, colStatus = 3, 
	type.gene1 = (-1), type.gene2 = (-1), 
	groups = c("All", "Two"), 
	PRINT = FALSE, PRINT.INDEX = FALSE)
}
\arguments{
  \item{file.out}{Output filename.
  }
  \item{gene.pairs}{Matrix of two columns, which are gene names.
  }
  \item{data.mut}{Integer matrix of genes by cases.  The first column contains gene names.  Each of the other columns contains mutation patterns of a case:  0 as wildtype, 1 amplification and -1 deletion.
  }
  \item{data.surv}{Data frame containing case ID, survival time and survival status.  Cases do not need to match those in \code{data.mut}.
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
  \item{PRINT}{Default is FALSE.  Prints intermediate values if set to TRUE.  Output may be massive if the number of gene pairs is large.
  }
  \item{PRINT.INDEX}{Default is FALSE.  Unused.
  }
}
\value{
Data frame containing the following columns (if groups="Two"): 
\item{gene1}{} 
\item{gene2}{}
\item{nSingleMut}{No. of cases with single mutation}
\item{nDoubleMut}{No. of cases with double mutation}
\item{obsSingleMut}{No. of deceased cases with single mutation}
\item{obsDoubleMut}{No. of deceased cases with double mutation}
\item{expSingleMut}{Expected no. of deceased cases with single mutation}
\item{expDbouleMut}{Expected no. of deceased cases with double mutation}
\item{medianSingleMut}{Estimated median survival time for single mutation}
\item{medianDoubleMut}{Estimated median survival time for double mutation}
\item{pValue}{p value for testing whether double/single mutation is associated with survival}
}
\references{
Wang, X., Fu, A. Q., McNerney, M. and White, K. P. (2014). Widespread genetic epistasis among breast cancer genes. Nature Communications. 5 4828. doi: 10.1038/ncomms5828
}
\author{
Audrey Q. Fu, Xiaoyue Wang
}

\examples{
\dontrun{
data (mutations)
data (survival)

# compute p values for gene pairs tested in the RNAi knockdown assay
data (tested_pairs)

# compute p values for the gain & loss combination
# and compare only cases of single mutations with cases of double mutations;
# results are written to file tmp.txt under current directory
computeSurvivalPValueForGenePairSet.output (file.out="tmp.txt", 
	tested_pairs, data.mut=mutations, data.surv=survival, 
	type.gene1=1, type.gene2=(-1), groups="Two")

}
}