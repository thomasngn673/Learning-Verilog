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
  * buf: uffers
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
