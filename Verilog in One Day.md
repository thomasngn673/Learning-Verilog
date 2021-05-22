# Verilog in One Day

[Verilog in One Day](http://www.asic-world.com/verilog/verilog_one_day1.html#Introduction)

## Introduction

**Verilog Design Cycle**

1. Specifications
2. High level design
3. Low level (micro) design
4. RTL coding
5. Verification
6. Synthesis

**Ex.** Design Cycle of an Arbiter

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
  * **Ex.** inout
* Vector Signals
  * **Ex.** inout [7:0] address
    * Little Endian: [7:0], reads *right-to-left*
    * Big Endian: [0:7], reads *left-to-right*

## Data Types

1. **reg**: stores and outputs a value
2. **wire**: connects two points, gives an output

## Operators

* NAND: ~&
* OR: |
* NOR: ~|
* XOR: ^
* XNOR: ~^

## Control Statements

* "begin" and "end" behave as { } in C
* If-Else Statements
  * **Ex.**
    * Decimal: 10
    * Hexadecimal: 16'hDEAD
    * Binary: 1'b1
* Case Statements
  * Opens with "case"
  * Closes with "endcase"
* While Statements
* For Loops
  * ++ and -- are not supported in Verilog
  * Incremental operators must be written out (i++ &#8594; i=i+1)
* Repeat
  * *repeat (n)* with 'n' being the # of times the code is ran

## Variable Assignment

* Combinational logic elements are modeled using *assign* and *always* statements.
* Sequential logic elements are modeled using *always* statements.
* Test benches use *initial* statements which only execute once.

## Always Blocks

* Always blocks will run simultaneously when one or more of the conditions listed is fulfilled.
* Can't drive 'wire' data type, but can drive 'reg' and 'integer' data types
* Must contain either:
  1. Sensitive list: tells the block when to execute
        * Level Sensitive
            * **Ex.** always @ (a or b or sel)
        * Edge Sensitive
            * **Ex.** always @ (posedge clk)
  2. Delay

        ``` Verilog
        always begin
            #5 clk = ~clk; // #5 means 5 time units
        end
        ```

* Assign Statement: modeling only combinational logic and executed continuously
  * **Ex.** assign out = (enable) ? data : 1'bz
  * If (enable == 1), data &#8594; out
  * Else, data &#8594; high-Z

## Task and Function

* Functions and tasks allow code to be repeated and reused.
* Function is:
  * Opened with 'function'
  * Closed with 'endfunction'
* Functions vs. Tasks
  * Tasks can have delays while functions can't. Therefore, combinational logic can use 'function'.
  * Functions can return a value, while tasks can't.

## Test Benches

