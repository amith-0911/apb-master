# APB Master

A basic APB master written in Verilog, with a testbench for trying a write transfer in Vivado.

## Project files

- `APB Master.v` - APB master design
- `APB_tb.v` - simulation testbench
- `apb_constraints.xdc` - 10 ns clock constraint for timing analysis

## Requirements

- AMD Vivado

## Run the simulation

Open the project in Vivado. Make sure `APB Master.v` is under Design Sources and `APB_tb.v` is under Simulation Sources.

Set `apb_master_tb` as the simulation top, then run behavioral simulation. The testbench sends a write transfer to address `32'hABCD_1234` with data `32'hFEDC_ABCD`.

Use Vivado's waveform viewer to follow the transfer through the idle, setup, and access states.

## Simulation result

The testbench lets you observe how the master responds when `pready` goes high. It does not include automatic pass or fail checks.

I used Vivado to synthesize and implement the design for practice. I do not have an FPGA board, so I have not tested the design on hardware.