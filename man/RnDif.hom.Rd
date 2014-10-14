\name{RnDif.hom}
\alias{RnDif.hom}
\title{2D Steady-state radon diffusion in a homogeneous porous medium.}
\description{Calls function RnDif.hom for 2D steady diffusion of radon. 
 Gives the radon concentrations and fluxes in a homogeneous porous medium.}
\usage{
RnDif.hom(lx, ly, nx, ny, e, m, rho, bdc_top,
rn_lam, rn_ema, rn_dif, rn_sol, solution, ...)
}
\arguments{
\item{lx}{x axis length of the soil column [L].}
  \item{ly}{y axis length (depth) of the soil column [L]. Only  positive values are accepted.}
  \item{nx}{Number of grid cells in the x direction.}
  \item{ny}{Number of grid cells in the y direction.}
  \item{e}{Soil porosity [-]. A constant value over the entire column.}
  \item{m}{Soil moisture [-]. A constant value over the entire column.}
  \item{rho}{Soil grain material density [M/L2]. A constant value over the entire column.}
  \item{bdc_top}{Fixed value in the upstream boundary in y-direction (top of the soil column)
  for a constant value of radon concentration [(1/T)*(1/L3)].}
  \item{rn_lam}{Radon decay constant [1/T].}
  \item{rn_ema}{Radon emanation ratio [atoms (1/L3)*(1/T)].}
  \item{rn_dif}{Radon diffusivity in free air [L2/T].}
  \item{rn_sol}{Radon solubility in water [-].}
  \item{solution}{Type of solution to be computed. Only "steady" is avaiable
  at the moment.}
  \item{\dots}{...}
}
\details{ To optimize the code: The number of grid cells (nx,ny) will depend on the user's own computer
 capability. Higher numbers will give a closer approximation to the exact solution. The quantity for ny should
 be larger than nx, this allows a greater discretization in the y-axis.
 
 Boundary conditions: Fixed value for radon concentration in the upstream
 boundary in y-direction (a negative y axis is considered), while the
 downstream boundary remains open. All the otther boundaries are closed off for transport.
 
 Fluxes output: The output of the fluxes indicates the flow direction in correspondence with y-axis.
 In the case where a negative y-axis is considered, a negative flux value represents upward flow
 (from bottom to top). If the y-axis considered is positive, then a negative flux value represents
 downward flow (from top to bottom). The radon fluxes are computed at the interface of each grid cell.
 }
\value{A list containing:
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
\note{At the moment there is no provision to deal with cross-diffusion between x and y-axis.

The concentrations of radon are only computed at the center of each grid cell, this implies that
the exact value in a cell interface (or in a boundary domain) will not be shown. Thus, the closest
value is taken as an approximation at this locations.}
\examples{

#################################################
#####---- Direct input for the function ----#####
#################################################

require(RadTran)

Dif=RnDif.hom(lx=1,ly=3,nx=50,ny=100,e=0.3,m=0.0,rho=2.65e3,bdc_top=1000,
rn_lam=2.09838e-6,rn_ema=10,rn_dif=1.1e-5,rn_sol=0.3565,solution="steady")

}
\keyword{RnDif.hom}