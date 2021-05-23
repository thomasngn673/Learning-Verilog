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

