library(rFEM)
library(RTriangle)
library(rgl)
setwd("~/workspace/SSR/RScripts")

source('../R/mesh.2D.R')
source('../R/SSR_Library.R')


order = 2

x = -20 : 20
y = -20 : 20
nodes = expand.grid(x, y)
mesh<-create.MESH.2D(nodes=nodes, order = order)
plot(mesh)

#mesh<-refine.MESH.2D(mesh,maximum_area = 0.05, delaunay = T)
#plot(mesh)

basisobj = create.FEM.basis(mesh, order)

#  smooth the data without covariates
lambda = 10

observation <-function(nodes)
{
  3*cos(0.2*nodes[,1])*cos(0.2*nodes[,2]) + rnorm(nrow(nodes), mean = 0, sd = 1)
}

data = observation(nodes)
BC = NULL

#BorderIndices = (1:length(mesh$nodesmarker))[mesh$nodesmarker==1]

#Indices= BorderIndices
#Values = rep(x = 0, times = length(Indices))
#BC = list(Indices = Indices, Values = Values)

## Due tipologie input
# output = smooth.LAPLACE.basis(locations  = locations, observations = data, 
#                                    basisobj = basisobj, lambda = lambda, covariates = covariates,
#                                    CPP_CODE = FALSE)

# output = smooth.LAPLACE.basis(locations  = as.matrix(locations), observations = data, 
#                               basisobj = basisobj, lambda = lambda, covariates = covariates,
#                               CPP_CODE = FALSE)

K_func<-function(points)
{
  mat<-c(1,0,0,1)/300
  as.vector(mat %*% t(points[,1]^2+points[,2]^2))
}

beta_func<-function(points)
{
  rep(c(0,0), nrow(points))
}

c_func<-function(points)
{
  rep(c(0), nrow(points))
}
u_func<-function(points)
{
  rep(c(1), nrow(points))
}
PDE_parameters = list(K = K_func, b = beta_func, c = c_func, u = u_func)


output = smooth.PDE_space_varying.basis(observations = data, 
                                        basisobj = basisobj, lambda = lambda, PDE_parameters = PDE_parameters, BC = BC)

#  plot smoothing surface computed using covariates
open3d()
plot(output$felsplobj, num_refinements = 10)

