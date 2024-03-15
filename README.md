# Reservoir Simulation

## Overview
This MATLAB script facilitates the simulation and visualization of pressure distribution and Darcy velocity in a reservoir using Darcy's law and the radial flow equation. It is designed to aid in understanding fluid flow behavior within subsurface reservoirs.

## Dependencies
- MATLAB

## Usage
1. Clone or download the repository.
2. Open the MATLAB script (`reservoir_simulation.m`) in MATLAB.
3. Modify parameters such as reservoir dimensions, porosity, permeability, viscosity, and pressures as needed.
4. Run the script.
5. View the generated plots illustrating pressure distribution and Darcy velocity within the reservoir.

## Parameters
- **R**: Reservoir radius in meters (m).
- **L**: Reservoir length in meters (m).
- **phi**: Porosity.
- **k**: Permeability in square meters (m²).
- **mu**: Viscosity in Pascal-seconds (Pa·s).
- **P_well**: Pressure at the well in Pascals (Pa).
- **P_external**: Pressure at the external boundary in Pascals (Pa).
- **R_well**: Radius of the well in meters (m).
- **R_external**: Radius at the external boundary in meters (m).

## Output
- Pressure distribution plot: Illustrates the variation of pressure from the well to the external boundary.
- Darcy velocity distribution plot: Shows the variation of Darcy velocity within the reservoir.
- Flow Rate: Displays the calculated flow rate in cubic meters per second (m³/s).
- Pressure and Darcy velocity at intervals: Tabular representation of pressure and Darcy velocity values at specified intervals along the reservoir radius.

