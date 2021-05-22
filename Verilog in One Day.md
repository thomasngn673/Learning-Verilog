# Verilog in One Day

[Verilog in One Day](http://www.asic-world.com/verilog/verilog_one_day1.html#Introduction)

## Introduction

Verilog Design Cycle

1. Specifications
2. High level design
3. Low level (micro) design
4. RTL coding
5. Verification
6. Synthesis

Ex. Design Cycle of an Arbiter

1. Specifications: Identify the requirements of the design
    * 2 bit
2. High level design: Identify inputs and outputs
    * ![Arbiter Block Diagram](http://www.asic-world.com/images/tidbits/aribiter_signal.gif)
    * State machine &#8594; State Transition Table &#8594; K-Map Simplification **OR** Design with Verilog
3. Low level (micro) design
    * ![Arbiter State Machine](http://www.asic-world.com/images/tidbits/aribiter_fsm.gif)
4. RTL coding
5. Verification
6. Synthesis

## Modules

A **module** contains inputs, outputs, and internal logic workings. It is also known as the "black box".

``` Verilog
module arbiter (
    clock,  // clock
    reset,  // Active high, syn reset
    req_0,  // Request 0
    req_1,  // Request 1
    gnt_0,  // Grant 0
    gnt_1   // Grant 1
);
    input clock;
    input reset;
    input req_0;
    input req_1;
    output gnt_0;
    output nt_1;
```

* Bi-Directional Ports
  * Ex. **inout**
* Vector Signals
  * Ex. **inout [7:0] address**
    * Little Endian: [7:0], reads *right-to-left*
    * Big Endian: [0:7], reads *left-to-right*

## Data Type

1. **reg**: stores and outputs a value
2. **wire**: connects two points, gives an output

## Operators


## Control Statements


## Variable Assignment


## Always Blocks


## Task and Function


## Test Benches

