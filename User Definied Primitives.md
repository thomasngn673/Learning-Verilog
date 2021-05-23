# User Defined Primitives

* UDP are used if a user needs more complex primitives beyond built-in gates, transmission gates, and switches.
* Syntax for a UDP is similar to a module.

``` Verilog
primitive udp_syntax (
    a,
    b,
    c,
    d
);

output a;
input b, c, d;

// UDP function is inserted here

endprimitive
```

* **UDP Rules**
  * Can only one output and 10 inputs
  * Can't have bidirectional ports
  * Can't declare a reg for the output terminal of a combinational UDP

* UDP *functionality* is described by using a 'table'
  * 'table' marks start of table and 'endtable' marks end of table

* Combinational Table Fields
  * Inputs : Q+

* Example of Combinational UDP

``` Verilog
// ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
// UDP function is inserted here
table // for A = B | C
    // B   C   :   A
       ?   1   :   1;
       1   ?   :   1;
       0   0   :   0;
endtable

endprimitive
```

## Symbols

* ' ? ' means 0 or 1 or x
  * don't-care
* %b means 0 or 1
* %f means (10)
  * Falling edge on an input
* %r means (01)
  * Rising edge on an input
* %p means (01) or (0x) or (x1) or (1z) or (z1)
  * Rising edge including x and z
* %n means (10) or (1x) or (x0) or (0z) or (z0)
  * Falling edge including x and z
* ' * ' means (??)
  * All transitions
* ' - ' means no change

## Level Sensitive Sequential UDP

* Sequential Table Fields
  * Inputs : Q : Q+
* Requires value of inputs and Q to find output

## Edge-Sensitive UDP

* Sequential Table Fields
  * Inputs : Q : Q+
* Differs from level sensitive in that output changes based on transitions of inputs