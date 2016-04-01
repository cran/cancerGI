\name{RNAi}
\alias{RNAi}
\docType{data}
\title{
Molecular phenotypes from single and double knockdowns in RNAi screen
}
\description{
Single and double siRNA knockdowns were performed for genes and gene pairs.  Multiple molecular phenotypes, such as the number of cells, cell size, nucleus size, etc., were measured.  
}
%%\usage{data (RNAi)}
\format{
  A data matrix with each row a knockdown experiment.
}
\references{
Wang, X., Fu, A. Q., McNerney, M. and White, K. P. (2014). Widespread genetic epistasis among breast cancer genes. Nature Communications. 5 4828. doi: 10.1038/ncomms5828
}
\examples{
\dontrun{
library (systemfit)
library (qvalue)

data (RNAi)
data (tested_pairs) # gene pairs tested in the RNAi knockdown assay

# extract gene names and put in a vector
genelist <- union(unique(RNAi$template_gene),unique(RNAi$query_gene))
genelist <- genelist[!((genelist=="empty")|(genelist=="NT"))]

# create the interaction terms for linear model
sorted_tested_pairs <- apply(tested_pairs,1,
	function(x){if (x[1]>x[2]) return (c(x[2],x[1])) 
	else return(c(x[1],x[2]))})
pairs_names <- apply(sorted_tested_pairs,2,
	function(x) {paste(x[1],x[2],sep=":")})

# create vector of covariates
# using batch3 as baseline
regressors <- c("batch1","batch2","batch4",genelist,pairs_names)

# construct the design matrix
my_matrix=constructDesignMatrix(data=RNAi, covariates=regressors)

# n (cell number) and csize (cell size) are on log2 scale already
# need to transform nsize (nucleus size) to original scale
RNAi.tmp <- RNAi
RNAi$nsize <- 2^RNAi.tmp$nsize
rm (RNAi.tmp)

# create formula from column names
eqlog2n <- as.formula (paste ("RNAi$n ~ ", 
	paste (colnames (my_matrix), collapse="+"), sep=''))
eqlog2csize <- as.formula (paste ("RNAi$csize ~ ", 
	paste (colnames (my_matrix), collapse="+"), sep=''))
eqnsize <- as.formula (paste ("RNAi$nsize ~ ", 
	paste (colnames (my_matrix), collapse="+"), sep=''))
system <- list (cell.number = eqlog2n, cell.size = eqlog2csize, nuc.size=eqnsize)

# perform seemingly unrelated regression
fitsur <- systemfit (system, "SUR", data=cbind (RNAi, my_matrix), maxit=100)

# extract coefficient estimates
log2n_fitsur_coef <- coef (summary (fitsur$eq[[1]]))
log2csize_fitsur_coef <- coef (summary (fitsur$eq[[2]]))
nsize_fitsur_coef <- coef (summary (fitsur$eq[[3]]))

# compute q values
log2n_coef_q <- qvalue (log2n_fitsur_coef[,4])$qvalues
log2csize_coef_q <- qvalue (log2csize_fitsur_coef[,4])$qvalues
nsize_coef_q <- qvalue (nsize_fitsur_coef[,4])$qvalues

# build three matrices of results
log2n_fitsur_coef <- data.frame (log2n_fitsur_coef, qvalue=log2n_coef_q)
colnames (log2n_fitsur_coef) <- c("Estimate", "StdError", "tValue", "pValue", "qValue")
log2csize_fitsur_coef <- data.frame (log2csize_fitsur_coef, qvalue=log2csize_coef_q)
colnames (log2csize_fitsur_coef) <- c("Estimate", "StdError", "tValue", "pValue", "qValue")
nsize_fitsur_coef <- data.frame (nsize_fitsur_coef, qvalue=nsize_coef_q)
colnames (nsize_fitsur_coef) <- c("Estimate", "StdError", "tValue", "pValue", "qValue")
}
}