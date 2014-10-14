\name{RadTran-package}
\alias{RadTran-package}
\alias{RadTran}
\docType{package}
\title{Radon and Soil Gas Transport in 2D}
\description{Contains 4 different cases for radon and soil gas steady-state transport
 in a porous medium. Only steady-state conditions are taken into account. Package contains: RnDif.hom (Steady diffusion of radon in a 2D homogeneous porous medium.), RnDif.het (Steady diffusion of radon in a 2D heterogeneous porous medium.),
 RnDifAdv.hom (Steady diffusion & advection of radon in a 2D homogeneous column of sand.), SoilAdv.hom (Steady advection of soil gas (Darcy Flow) in a 2D homogeneous column of sand).
}
\details{
Package: RadTran
Type: Package
Version: 1.0
Date: 2014-10-16
License: GNU Public License 2 or above
}
\author{Francisco Lopes <fmlopes@fc.ul.pt>}
\note{At the moment there is no provision to deal with cross-diffusion between x and y-axis.

The concentrations of radon and disturbances pressure values are only computed at the center
of each grid cell, this implies that their exact value in a cell interface (or in a boundary domain)
will not be shown. Thus, the closest value is taken as an approximation at this locations. 

All the radon and soil gas fluxes are computed at the interface of each grid cell.}
\references{
Andersen CE. Radon Transport Modelling: Users guide to RnMod3d. Riso National Laboratory, Roskilde, Denmark, 2000.

Andersen CE, Albarracin D, Csige I, van der Graaf ER, Jiranek M, Rehs B, Svoboda Z, Toro L. ERRICCA radon model intercomparison exercise. Riso-R-1120 (EN), Riso National Laboratory, DK-4000 Roskilde, Denmark (available as a internet publication at www.risoe.dk), 1999.

Soetaert K., Meysman F., 2012. R-package ReacTran: Reactive Transport Modelling in R.

Soetaert K., Meysman F., 2011. Reactive transport in aquatic ecosystems: Rapid model prototyping
in the open source software R.

Soetaert K., Meysman F., 2009. Solving partial differential equations, using R package ReacTran.
}
\keyword{RadTran}