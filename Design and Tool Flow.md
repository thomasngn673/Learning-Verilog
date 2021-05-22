# Design and Tool Flow

## Tools for Design Flow

* *Specification*: MS Word
* *High Level Design*: MS Word, waveformer/testbencher for waveform creation
* *Low Level (Micro) Design*: MS Word, waveformer/testbencher for waveform creation
* *RTL Coding*: Vim, Emacs, conTEXT, HDL TurboWriter
* *Simulation*: ModelSim, VCS, Verilog-XL, Icarus
* *Synthesis*: Design Compiler, downloadable from Altera and Xilinx
* *Place & Route*: LASI, Magic
* *Post Silicon Validation*

## Typical Design Flow

![Typical Design Flow](http://www.asic-world.com/images/verilog/design_flow.gif)

* Specification: define important parameters of the system
  * **Ex.** 4-bit, synchronous reset, active high enable, when reset is active output should go to '0'

* High Level Design: splitting system into blocks based on function
  * **Ex.** Microprocessor has blocks: registers, ALU, Instruction Decode, Memory Interface

* Low Level (Micro) Design: designer describes how each block is implemented, draw waveforms
  * Includes details of state machines, counters, MUX, decoders, internal registers

* RTL Coding: low level design is written with Verilog/VHDL

* Simulation: verifying RTL code using test benches
  * Use a waveform output from a simulator to see if DUT (Device Under Test) functions correctly
  * **Timing Simulation/SDF Simulation/Gate Level Simulation**: completed after synthesis and P&R and is used to check if DUT works with gate and wire delays
    * ![Example Timing Simulation](http://www.asic-world.com/images/verilog/vcount_sim.gif)

* Synthesis: mapping RTL code to gates, aware of gate delays but *not* wire delays
  * ![Synthesis Diagram](http://www.asic-world.com/images/verilog/syn_flow.gif)
  * Formal Verification: manual verification of RTL to gate mapping
  * Scan Insertion: insert scan chain if ASIC

* Place & Route: all gates and flip-flops are placed, clock and reset are routed

* Post Silicon Validation: physical chip verification