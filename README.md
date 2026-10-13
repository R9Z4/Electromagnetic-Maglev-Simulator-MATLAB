# 3D Electromagnetic Maglev Simulator & GUI App (MATLAB)

An interactive MATLAB application and 3D simulation framework for modeling the physical dynamics of a homopolar linear magnetic motor (Maglev Train) inside a helical copper coil.

Developed as a comprehensive project bridging **Electromagnetic Field Theory** and **Scientific Software Engineering** at the Department of Electrical Engineering, **Ferdowsi University of Mashhad (FUM)**.

---

## Overview & Theoretical Formulation

The system operates based on direct electromechanical energy conversion. A moving unit consisting of a chemical battery and two neodymium dipole magnets travels through a bare copper coil tunnel:

1. **Ampere's Circuital Law:**  
   $$\oint \vec{B} \cdot d\vec{l} = \mu_0 I_{\text{enc}} \implies B \approx \mu_0 n I$$  
   Current flow between the conducting magnets magnetizes the active section of the coil.

2. **Magnetic Propulsion Force:**  
   The force on the neodymium dipoles ($ \vec{m} $) within the non-uniform magnetic field gradient is computed as:  
   $$\vec{F}_{\text{mag}} = \nabla (\vec{m} \cdot \vec{B})$$

3. **Nonlinear Equation of Motion:**  
   Accounting for magnetic propulsive force, Coulomb friction, and viscous aerodynamic/eddy drag:  
   $$m \frac{dv}{dt} = F_{\text{mag}} - \mu m g - c v$$

---

## Features & Implementation Architecture

- **Interactive GUI (MATLAB App Designer):**  
  - Dynamic sliders for mass ($m$), magnetic propulsion force ($F_{\text{mag}}$), and friction coefficient ($\mu$).
  - Real-time gauge cluster showing instantaneous velocity ($v$).
  - 2D animated trajectory view with real-time tunnel boundaries.
- **Numerical ODE Solver:**  
  - Solves the nonlinear equations of motion using MATLAB's adaptive Runge-Kutta solver (`ode45`).
- **3D Helical & Surface Rendering:**  
  - Parametric 3D copper helix generation ($x, y, z$).
  - Gouraud lighting model with active camera light source (`camlight`, `lighting gouraud`).
  - Dynamic cylinder mesh animation with live velocity text rendering.

---

## File Structure

```
├── Maglev_Simulator_App.mlapp   # Interactive MATLAB App Designer GUI
├── Maglev_3D_Visualizer.m       # 3D Helical trajectory visualizer (Workspace coupled)
├── Demo_GUI_App.mp4             # Demonstration video of the App Designer GUI
├── Demo_3D_Simulation.mp4       # Demonstration video of the 3D rendering simulation
├── Technical_Report.pdf         # Full technical report (Derivation, architecture & results)
└── README.md                    # Project documentation
```

---

## How to Run

1. Open MATLAB (R2020b or later).
2. Launch the App Designer application:
   ```matlab
   open('Maglev_Simulator_App.mlapp')
   ```
3. Adjust physical parameters via sliders and click **Run**.
4. To view the advanced 3D helical simulation, execute the visualizer script in MATLAB after running the app:
   ```matlab
   Maglev_3D_Visualizer
   ```

---

## Author

- **Reza Roodi**  
- Department of Electrical Engineering, Ferdowsi University of Mashhad (FUM)
