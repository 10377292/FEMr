% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/FEMr.smoothing_R.R
\name{R_eval.FEM.basis}
\alias{R_eval.FEM.basis}
\title{Compute Values of Finite Element Basis Functions or their Derivatives}
\usage{
R_eval.FEM.basis(basisobj, locations, nderivs = matrix(0,1,2))
}
\arguments{
\item{basisobj}{An an object of type FEM; See \link{create.FEM.basis}.}

\item{locations}{A 2 column matrix where each row specifies the coordinates of the corresponding observation.}

\item{nderivs}{A 2-elements vector specifying the partial derivatives order of the basis functions to evaluate. The vectors' element must
be 0,1 or 2, where 0 indicates that the original basis function should be evaluated.}
}
\value{
A matrix of basis function values. Each row indicates the location where the evaluation has been taken, the column indicates the 
basis function evaluated
}
\description{
The evaluation on a set of locations is performed for all the basis functions representing the Finite Element finite-dimensional space. Also their derivatives up to order 2 can be evaluated. 
This version of the function is implemented using only R code. It is called by \link{R_smooth.FEM.basis}.
This function is usuful for the construction of the discretized problem when the mesh nodes are indipendent from the observations' locations. This case is not treated
in Sangalli, Ramsay, Ramsay (2013), see e.g. Azzimonti et al. (2014).
}
\references{
Sangalli, L.M., Ramsay, J.O. & Ramsay, T.O., 2013. Spatial spline regression models. Journal of the Royal Statistical Society. Series B: Statistical Methodology, 75(4), pp.681.703.
 Azzimonti, L. et al., 2014. Blood flow velocity field estimation via spatial regression with PDE penalization Blood flow velocity field estimation via spatial regression with PDE penalization. , (September), pp.37.41.
}

