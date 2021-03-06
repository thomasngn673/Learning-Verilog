# Verilog Syntax and Semantics

## Numbers in Verilog

* Integer Numbers
  * **Syntax**: `<size>'<radix><value>`
    * *Size*: sized, unsized (32 bits) numbers
    * *Radix*: binary, octal, decimal, hexadecimal
  * **Ex.** "6'b100011" is stored as "100011".
  * When `<size>` is smaller than `<value>`, then leftmost bits of `<value>` are truncated.
  * When `<size>` is larger than `<value>`, then leftmost bits of `<value>` are filled with '0'.

* Real Numbers
  * **Syntax**: 
    * `<value>.<value>`
    * `<mantissa>E<exponent>`
  * **Ex.**
    * 1.2 is stored as 1.2
    * 3.5E6 is stored as 3500000.0

## Modules

* Ports
  * Allows for communication between a module and environment
  * Connected by:
    1. Port Order/Implicit **OR**

        ``` Verilog
        addbit u0 (
            r1[0],
            r2[0],
            ci,
            result[0],
            c1
        );
        ```

    2. Name

        ``` Verilog
        addbit u0 (
            .a (r1[0]),
            .b (r2[0]),
            .ci (ci),
            .sum (result[0]),
            .co (c1)
        );
        ```

  * Direction: input, output, or inout
  * **Syntax:** `direction [range_val:range_var] list_of_identifers`
  * **Ex.** `input [15:0] data_in`

## Port Connection Rules

* Inputs
  * Internal: type 'net'
  * External: type 'reg' or 'net'

* Output
  * Internal: type 'reg' or 'net'
  * External: type 'net'

* Inout
  * Internal, External: type 'net'

* Ex. Implicit Unconnected Port

  ``` Verilog
  // q_bar is not connected
  dff u0 (
      q,
       , // q_bar is omitted from this module
      clk,
      d,
      rst,
      pre
  );
  ```

* Ex. Explicit Unconnected Port

  ``` Verilog
  // q_bar is not connected
  dff u0 (
      .q (q),
      .q_bar (),
      .clk (clk),
      .d (d),
      .rst (rst),
      .pre (pre)
  );
  ```

## Hierarchical Identifiers

* Based on top module identifer followed by module instant identifiers, separated by periods

* **Ex.**

  ``` Verilog
  addbit u0 (r1[0], r2[0], ci, result[0], c1);
  
  // Hierarchical Identifiers
  tb.U.u0.sum
  // tb = test bench
  // U = connection to lower module
  // u0 = addbit u0

## Data Types

* Nets: represent structural connections between components
  * **wire, tri**: connecting wires
  * **wor, trior**: wired outputs OR'd together
  * **wand, triand**: wired outputs AND'd together
  * **tri0, tri1**: net pulls-down, pulls-up when not driven
  * **supply0, supply1**: net has constant 0 or logic 1
  * **trireg**: retains last value when driven to z (tristate)
* Registers: represent variables used to store data
  * **reg**: unsigned variable
  * **integer**: signed variable - 32 bits
  * **time**: unsigned integer - 64 bits
  * **real**: double precision floating point variable
* Signal Data Type Declarations
  1. Explicitly declared
  2. Implicitly declared
* Strings
  * **Syntax**: `$display("%s", string)`
