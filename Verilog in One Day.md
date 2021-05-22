# Verilog in One Day

## [Verilog in One Day](http://www.asic-world.com/verilog/verilog_one_day1.html#Introduction)

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

<br/>

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

<br/>

## Data Types

1. **reg**: stores and outputs a value
2. **wire**: connects two points, gives an output

<br/>

## Operators

* NAND: ~&
* OR: |
* NOR: ~|
* XOR: ^
* XNOR: ~^

<br/>

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

<br/>

## Variable Assignment

* Combinational logic elements are modeled using *assign* and *always* statements.
* Sequential logic elements are modeled using *always* statements.
* Test benches use *initial* statements which only execute once.

<br/>

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

<br/>

## Task and Function

* Functions and tasks allow code to be repeated and reused.
* Function is:
  * Opened with 'function'
  * Closed with 'endfunction'
* Functions vs. Tasks
  * Tasks can have delays while functions can't. Therefore, combinational logic can use 'function'.
  * Functions can return a value, while tasks can't.

<br/>

## Test Benches

### Full Code for Arbiter

1. Declare the module which lists all variables.

``` Verilog
module arbiter (
    clock,
    reset,
    req_0,
    req_1,
    gnt_0,
    gnt_1
);
```

2. Define inputs and output regs.

``` Verilog
input clock, reset, req_0, req_1;
output reg gnt_0, gnt_1;
```

3. Define *always* blocks with states defined by the state machine of the system.

``` Verilog
always @ (posedge clock or posedge reset)
if (reset) begin
  gnt_0 <= 0;
  gnt_1 <= 0;
end

else if (req_0) begin
  gnt_0 <= 1;
  gnt_1 <= 0;
end

else if (req_1) begin
  gnt_0 <= 0;
  gnt_1 <= 1;
end
endmodule
```

4. Declare arbiter test bench module.

``` Verilog
module arbiter_tb;
```

5. Define test bench data types.

``` Verilog
reg clock, reset, req0, req1;
wire gnt0, gnt1;
```

6. Define *initial* block to initialize all variables.

``` Verilog
initial begin
  $monitor ("req0=%b, req1=%b, gnt0=%b, gnt1=%b", // %b: byte type
            req0, req1, gnt0, gnt1); // monitor outputs
  clock = 0;
  reset = 0;
  req0 = 0;
  req1 = 0;
  #5 reset = 1;
  #15 reset = 0;
  #10 req0 = 1;
  #10 req0 = 0;
  #10 req1 = 1;
  #10 req1 = 0;
  #10 {req0, req1} = 2'b11; // 2-bit number 11
  #10 {req0, req1} = 2'b00; // 2-bit number 00
  #10 $finish; // terminate simulation
end
```

7. Generate the clock using an *always* block.

``` Verilog
always begin
  #5 clock = !clock; // pulse the clock every 5 time units
end
```

8. Link original variables with test bench variables.

``` Verilog
arbiter U0 (
  .clock (clock),
  .reset (reset),
  .req_0 (req0),
  .req_1 (req1),
  .gnt_0 (gnt0),
  .gnt_1 (gnt1)
);
```
