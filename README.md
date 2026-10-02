# APB Master

A Verilog APB master and testbench created as a learning project. The design uses a finite-state machine to control a write transfer through the idle, setup, and access phases.

## Project files

- `APB Master.v` - APB master design
- `APB_tb.v` - testbench that applies reset and a write transfer
- `apb_constraints.xdc` - 10 ns clock constraint for timing analysis

## Requirements

- AMD Vivado

## Run the simulation

Open the project in Vivado. Check that `APB Master.v` is listed under Design Sources and `APB_tb.v` is listed under Simulation Sources.

Set `apb_master_tb` as the simulation top, then select Run Simulation and Run Behavioral Simulation.

The testbench creates a clock, applies reset, and requests a write transfer. It uses address `32'hABCD_1234` and data `32'hFEDC_ABCD`. It then raises `pready` so the access can complete.

## View the waveform

When the behavioral simulation opens, add the signals you want to inspect to the waveform window. Useful signals include `clk`, `reset_n`, `transfer`, `pselx`, `penable`, `paddr`, `pwdata`, `pwrite`, and `pready`.

Run the simulation and follow the signals through the idle, setup, and access phases. The waveform helps show when the master selects the peripheral, starts the access, and waits for `pready`.

## Timing constraint

The XDC file contains a 10 ns clock period constraint. This corresponds to an assumed 100 MHz clock for timing analysis. I am not using an FPGA board, so this is an analysis assumption and not a board clock setting.

## Simulation result

The testbench is intended for observing the write transfer in Vivado's waveform viewer. It does not include automated pass or fail checks.

I used Vivado to synthesize and implement the design for practice. I have not tested it on an FPGA board.