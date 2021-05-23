# Gate Level Modeling

## Gate Primitives

* Gate primitives include:
  * AND
  * NAND
  * OR
  * NOR
  * XOR
  * XNOR
* ![Gate Primitives](http://www.asic-world.com/images/verilog/combo_gates.gif)
* Gates have one scalar output and multiple scalar inputs
* **Syntax**: `gate U(out, in1, in2, in3)`

## Transmission Gate Primitives

* Transmission gates include:
  * NOT
  * buf: buffers
  * bufif0: tri-state buffers with active low
  * bufif1: tri-state buffers with active high
  * notif0: tri-state inverter with active low
  * notif1: tri-state inverter with active high
* ![Transmission Gates](http://www.asic-world.com/images/verilog/bufs.gif)
* Transmission gates are bi-directional and can be resistive & non-resistive
* Transmission gates are always on and do not have a control line
* Used to interface two wires with separate drives or to weaken signals

## Switch Primitives

* Switch Primitives include:
  1. pmos: uni-directional PMOS switch
  1. rpmos: resistive PMOS switch

  2. nmos: uni-directional NMOS switch
  2. rnmos: resistive NMOS switch

  3. cmos: uni-directional CMOS switch
  3. rcoms: resistive CMOS switch

  4. tranif1: bi-directional transistor (high)
  4. tranif0: bi-directional transistor (low)

  5. rtranif1: resistive transistor (high)
  5. rtranif0: resistive transistor (low)

  6. tran: bi-directional pass transistor
  6. rtran: resistive pass transistor

  7. pullup: pull up resistor
  8. pulldown: pull down resistor

* ![Switches](http://www.asic-world.com/images/verilog/switch_prms.gif)

## Verilog Strength Levels

7. Supply drive: supply0, supply1
6. Strong pull: strong0, strong1
5. Pull drive: pull0, pull1
4. Large capacitance: large
3. Weak drive: weak0, weak1
2. Medium capacitance: medium
1. Small capacitance: small
0. Hi Impedance: highz0, highz1

## Designing Using Primitives

* Used only in library development where ASIC vendor provides a library using Verilog primitives and user defined primitives

### **Example**: Designing AND gate from 2 NAND gates

![AND Gate from NAND Gate](http://www.asic-world.com/images/verilog/and_from_nand.gif)

``` Verilog
module and_from_nand()

reg x, y;
wire f, w;

// nand Un (outputs, inputs);
nand U1(w, x, y);
nand U2(f, w, w);

// test bench code
initial begin
    $monitor ("x = %b\t y = %b\t f = %b\t, x, y, f);
    x = 0;
    y = 0;
    #1 x = 1;
    #1 y = 1;
    #1 x = 0;
    #1 $finish;
end

endmodule
```

## Gate and Switch Delays

* **Syntax**: #num
  * '#' is a character that introduces delay
  * num is the number of time units that the statement should delay by
  * **Ex.** `#1 a = b`
    * a = b executes after 1 time unit

* Delay Types
  * Rise Delay: (0, x, z) &#8594; y
  * Fall Delay: (1, x, z) &#8594; 0
  * Turn-off Delay: (0, 1, x) &#8594; z
  * Min Value: minimum expected delay value
  * Typ Value: typical expected delay value
  * Max Value: maximum expected delay value

* Delays can be created by using buffers, gates and transmission gates
  * Logic gates have one output and any number of inputs
  * buffers & NOT gates have any number of outputs and one input

### Example of Specified Delays

``` Verilog
// Delay for all transitions
or #(5) u_or(out1,b,c);

// Rise and fall delay
and #(1,2) u_and(out2,b,c);

// Rise, fall and turn off delay
nor #(1,2,3) u_nor(out3,b,c);

// One Delay, min, typ and max
nand #(1:2:3) u_nand(out4,b,c);

//Two delays, min,typ and max
buf #(1:4:8,4:5:6) u_buf(out5,b);

//Three delays, min, typ, and max
notif1 #(1:2:3,4:5:6,7:8:9) u_notif1(out6,b,c);
```

