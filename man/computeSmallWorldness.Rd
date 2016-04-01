\name{computeSmallWorldness}
\alias{computeSmallWorldness}
\title{Compute smallworldness of a graph}
\description{This function computes the smallworldness of a graph.  
}
\usage{
computeSmallWorldness(g, n, m, nrep = 1000)
}
\arguments{
  \item{g}{A graph object.
  }
  \item{n}{Number of nodes of g.
  }
  \item{m}{Number of edges of g.
  }
  \item{nrep}{Number of random graphs to generate for estimating \eqn{C_{rand}} and \eqn{L_{rand}}.
  }
}
\details{
For a graph \eqn{g} with \eqn{n} nodes and \eqn{m} edges, the smallworldness \eqn{S} is defined as in Humphries and Gurney (2008): 

\eqn{S = (C_g / C_{rand}) / (L_g / L_{rand})},

where \eqn{C_g} and \eqn{C_{rand}} are the clustering coefficient of \eqn{g} and that of a random graph with the same number of nodes and edges as \eqn{g}, respectively.  Also, \eqn{L_g} and \eqn{L_{rand}} are the mean shortest path length of \eqn{g} and that of the same random graph, respectively.  

Here, in order to estimate \eqn{C_{rand}} and \eqn{L_{rand}}, this function generates a large number of random graphs with \eqn{n} nodes and \eqn{m} edges under the Erdos-Renyi model (Erdos and Renyi, 1959), such that each edge is created with the same probability as the nodes in \eqn{g}. This function then computes \eqn{C} and \eqn{L} for each random graph, and takes the average as the estimate for \eqn{C_{rand}} and \eqn{L_{rand}}.
}
\value{
A scalar of smallworldness.
}
\references{
Humphries, M. D. and Gurney, K. Network 'small-world-ness': a quantitative method for determining canonical network equivalence. PLoS ONE 3, e0002051 (2008).

Erdos, P. and Renyi, A. On random graphs. Publ. Math. 6, 290-297 (1959).

Wang, X., Fu, A. Q., McNerney, M. and White, K. P. (2014). Widespread genetic epistasis among breast cancer genes. Nature Communications. 5 4828. doi: 10.1038/ncomms5828
}
\author{
Audrey Q. Fu
}
\examples{
library (igraph)
# compute smallworldness for the design graph
data (tested_pairs)
# build the graph object
g <- graph.edgelist (as.matrix (tested_pairs), directed=FALSE)
summary (g)  # 67 nodes and 1508 edges
# compute smallworldness
computeSmallWorldness (g, n=67, m=1508)
}