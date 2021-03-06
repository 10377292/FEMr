% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/FEMr.objects.R
\name{image.FEM}
\alias{image.FEM}
\title{Image Plot of a FEM object}
\usage{
\method{image}{FEM}(x, num_refinements, ...)
}
\arguments{
\item{x}{A FEM object.}

\item{num_refinements}{A natural number specifying how many bisections should by applied to each triangular element for
plotting purposes. This functionality is useful where a discretization with 2nd order Finite Element is applied.}

\item{...}{Arguments representing  graphical options to be passed to \link[rgl]{plot3d}.}
}
\description{
Image plot of a FEM object, generated by \code{FEM} or returned by \code{smooth.FEM.basis}, \code{smooth.FEM.PDE.basis} or
\code{smooth.FEM.PDE.SV.basis} can be visualized trough an image plot.
}
\examples{
## Upload a triangular mesh and plot it
data("mesh.2D.rectangular")
plot(mesh.2D.rectangular)
## Create a linear Finite Element basis
basisobj = create.FEM.basis(mesh.2D.rectangular, 1)
## Define a sinusoidal function as expansion of these basis and plot it
coeff <- sin(mesh.2D.rectangular$nodes[,1])*cos(mesh.2D.rectangular$nodes[,2])
FEM_object<- FEM(coeff, basisobj)
image(FEM_object)
}

