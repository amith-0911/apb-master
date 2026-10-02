```markdown

&#x20;***APB Master***



This is a small Verilog project I made while learning how an APB master works. It contains a master module and a testbench, and I used Vivado to work with the design.



&#x20;***What the design does***



The master has three states: idle, setup, and access. It waits for `transfer`, presents the address and write data during setup, then enters access and waits for the slave to raise `pready`.



The design supports write transfers. It does not include read-data handling or error responses.



&#x20;***Files***



\- `APB\_master.v` — the APB master module

\- `APB\_master\_tb.v` — the testbench

\- `apb\_constraints.xdc` — a 10 ns clock constraint used for timing analysis



Update these filenames if they differ from the names in the repository.



&#x20;***Running the simulation***



In Vivado, use `apb\_master` as the design top and `apb\_master\_tb` as the simulation top. Then run \*\*Run Behavioral Simulation\*\*.



The testbench applies a write transfer with address `32'hABCD\_1234` and data `32'hFEDC\_ABCD`, then raises `pready` to complete the access.



&#x20;***Timing and project status***



The XDC file specifies a 10 ns clock period (100 MHz) for timing analysis. I’m not using an FPGA board, so this is an assumed clock period and the design has not been tested on hardware.



I ran synthesis and implementation in Vivado. This is a learning project, not a complete APB verification or production design.

```

