APB Master

This is a small Verilog project I made while learning how an APB master works. It includes the design and a testbench that I ran in Vivado.

Project files

APB Master.v contains the master design. It moves through idle, setup, and access states to handle a transfer.

APB_tb.v contains the testbench. It creates the clock, applies reset, sends a write transfer, and raises pready to let the transfer finish.

apb_constraints.xdc sets a 10 ns clock period for timing analysis.

Requirements

AMD Vivado is needed to open the project and run the simulation.

Run the simulation

In Vivado, make sure APB Master.v is under Design Sources and APB_tb.v is under Simulation Sources. Set apb_master_tb as the simulation top, then run behavioral simulation.

The testbench sends a write transfer to address 32'hABCD_1234 with data 32'hFEDC_ABCD. You can follow the transfer signals in Vivado’s waveform viewer.

Simulation result

The testbench lets you observe how the master responds when pready goes high. It does not include automatic pass or fail checks.

I used Vivado to synthesize and implement the design for practice. I do not have an FPGA board, so I have not tested it on hardware.