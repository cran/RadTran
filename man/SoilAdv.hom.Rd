\name{SoilAdv.hom}
\alias{SoilAdv.hom}
\title{2D Steady-state soil gas advection (Darcy Flow) in a homogeneous column of sand.}
\description{Calls function SoilAdv.hom for 2D steady advection of soil gas. 
 Gives the disturbance pressures and fluxes in a homogeneous column of sand.
}
\usage{
SoilAdv.hom(lx, ly, nx, ny, e, k_soil, miu, dp_bot, dp_top, solution, ...)
}
\arguments{
\item{lx}{x axis length of the medium column [L].}
  \item{ly}{y axis length (depth) of the medium column [L]. Only  positive values are accepted.}
  \item{nx}{Number of grid cells in the x direction.}
  \item{ny}{Number of grid cells in the y direction.}
  \item{e}{Sand porosity [-]. A constant value over the entire column.}
  \item{k_soil}{The gas permeability of the sand [L2].}
  \item{miu}{Air viscosity [M*(1/L*T)].}
  \item{dp_bot}{Fixed value in the downstream boundary in y-direction (bottom of the sand column)
  for a constant value of disturbance pressure [M*(1/L*1/T2)]. Only positive (or zero) values are accepted,
  otherwise the steady state will not be reached.}
  \item{dp_top}{Fixed value in the upstream boundary in y-direction (top of the sand column)
  for a constant value of disturbance pressure [M*(1/L*1/T2)]. Only negative (or zero) values are accepted,
  otherwise the steady state will not be reached.}
  \item{solution}{Type of solution to be computed. Only "steady" is avaiable
  at the moment.}
  \item{\dots}{...}
}
\details{To optimize the code: The number of grid cells (nx,ny) will depend on the user's own computer
 capability. Higher numbers will give a closer approximation to the exact solution. The quantity for ny should
 be larger than nx, this allows a greater discretization in the y-axis.
 
 Boundary conditions: Fixed values for the disturbance pressure in the upstream and downstream
 boundary in y-direction (a negative y axis is considered). All the otther boundaries are closed off for transport.
 
 Fluxes output: The output of the fluxes indicates the flow direction in correspondence with y-axis.
 In the case where a negative y-axis is considered, a negative flux value represents upward flow
 (from bottom to top). If the y-axis considered is positive, then a negative flux value represents
 downward flow (from top to bottom). The soil gas fluxes are computed at the interface of each grid cell.
 }
\value{
A list containing:
  \item{x.axis}{X axis vector (1:nx) for disturbances pressure and fluxes [L].}
  \item{y.axis.press}{Y axis vector (1:ny) for the disturbances pressure output [L].}
  \item{y.axis.flux}{Y axis vector (1:ny+1) for the radon fluxes output [L]. }
  \item{press}{Disturbance pressures in the center of each grid cell, a [1:nx,1:ny] matrix [M*(1/L*1/T2)].}
  \item{flux}{Soil gas fluxes in the center of each grid cell in the y-direction, a [1:nx,1:ny+1] matrix [L3/T].}
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
\note{At the moment there is no provision to deal with cross-advection between x and y-axis.

The disturbances pressure values are only computed at the center of each grid cell, this implies that
the exact value in a cell interface (or in a boundary domain) will not be shown. Thus, the closest
value is taken as an approximation at this locations.}
\examples{
#################################################
#####---- Direct input for the function ----#####
#################################################

require(RadTran)

Adv2D=SoilAdv.hom(lx=1,ly=3,nx=50,ny=100,e=0.1,k_soil=2e-10,miu=17.5e-6,
dp_bot=0,dp_top=-3,solution="steady")

}
\keyword{SoilAdv.hom}