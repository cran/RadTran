\name{RnDifAdv.hom}
\alias{RnDifAdv.hom}
\title{2D Steady-state radon diffusion & advection in a homogeneous column of sand.}
\description{Calls function RnDifAdv.hom for 2D steady diffusion & advection of radon. 
 Gives the radon concentrations and fluxes in a homogeneous column of sand.}
\usage{
RnDifAdv.hom(lx, ly, nx, ny, e, m, bdc_top,
rn_lam, rn_sol, k_soil, d_bulk, miu, dp, solution, ...)
}
\arguments{
\item{lx}{x axis length of the medium column [L].}
  \item{ly}{y axis length (depth) of the medium column [L]. Only  positive values are accepted.}
  \item{nx}{Number of grid cells in the x direction.}
  \item{ny}{Number of grid cells in the y direction.}
  \item{e}{Medium porosity [-]. A constant value over the entire column.}
  \item{m}{Medium moisture [-]. A constant value over the entire column.}
  \item{bdc_top}{Fixed value in the upstream boundary in y-direction (bottom of the sand column)
  for a constant value of radon concentration [(1/T)*(1/L3)].}
  \item{rn_lam}{Radon decay constant [1/T].}
  \item{rn_sol}{Radon solubility in water [-].}
  \item{k_soil}{The gas permeability of the sand [L2].}
  \item{d_bulk}{bulk diffusivity [L2/T].}
  \item{miu}{Air viscosity [M*(1/L*T)].}
  \item{dp}{Fixed value in the upstream boundary in y-direction (bottom of the sand column)
  for a constant value of disturbance pressure [M*(1/L*1/T2)].}
  \item{solution}{Type of solution to be computed. Only "steady" is avaiable
  at the moment.}
  \item{\dots}{...}
}
\details{To optimize the code: The number of grid cells (nx,ny) will depend on the user's own computer
 capability. Higher numbers will give a closer approximation to the exact solution. The quantity for ny should
 be larger than nx, this allows a greater discretization in the y-axis.
 
 Boundary conditions: Fixed value for radon concentration and disturbance pressure in the upstream
 boundary in y-direction (a positive y axis is considered). All the otther boundaries are closed off for transport.
 
 Fluxes output: The output of the fluxes indicates the flow direction in correspondence with y-axis.
 In the case where a negative y-axis is considered, a negative flux value represents upward flow
 (from bottom to top). If the y-axis considered is positive, then a negative flux value represents
 downward flow (from top to bottom). The radon fluxes are computed at the interface of each grid cell.
 
 Backward finite differences approximation is used for the advection flow.
 }
\value{
A list containing:
  \item{x.axis}{X axis vector (1:nx) for radon concentrations and fluxes [L].}
  \item{y.axis.conc}{Y axis vector (1:ny) for the radon concentrations output [L].}
  \item{y.axis.flux}{Y axis vector (1:ny+1) for the radon fluxes output [L]. }
  \item{conc}{Radon concentrations in the center of each grid cell, a [1:nx,1:ny] matrix [(1/T)*(1/L3)].}
  \item{flux}{Radon fluxes in the interface of each grid cell in the y-direction, a [1:nx,1:ny+1] matrix [1/T2].}
}
\references{
Andersen CE. Radon Transport Modelling: Users guide to RnMod3d. Riso National Laboratory, Roskilde, Denmark, 2000.

Andersen CE, Albarracin D, Csige I, van der Graaf ER, Jiranek M, Rehs B, Svoboda Z, Toro L. ERRICCA radon model intercomparison exercise. Riso-R-1120 (EN), Riso National Laboratory, DK-4000 Roskilde, Denmark (available as a internet publication at www.risoe.dk), 1999.

Soetaert K., Meysman F., 2012. R-package ReacTran: Reactive Transport Modelling in R.

Soetaert K., Meysman F., 2011. Reactive transport in aquatic ecosystems: Rapid model prototyping
in the open source software R.

Soetaert K., Meysman F., 2009. Solving partial differential equations, using R package ReacTran.
}
\author{Francisco Lopes <fmlopes@fc.ul.pt>}
\note{At the moment there is no provision to deal with cross-diffusion&advection between x and y-axis.

The concentrations of radon are only computed at the center of each grid cell, this implies that
the exact value in a cell interface (or in a boundary domain) will not be shown. Thus, the closest
value is taken as an approximation at this locations.}
\examples{
#################################################
#####---- Direct input for the function ----#####
#################################################

require(RadTran)

AdvDif=RnDifAdv.hom(lx=1,ly=5,nx=50,ny=100,e=0.3,m=0.0,bdc_top=5000,
rn_lam=2.09838e-6,rn_sol=0.3565,k_soil=1e-11,d_bulk=1e-6,miu=17.5e-6,
dp=-100,solution="steady")

}
\keyword{RnDifAdv.hom}