# Levels of Abstraction with a Half Adder

[Summary of Types of Flip-flop Behavior](http://osp.mans.edu.eg/cs212/Seq_circuits_Summary_FF-types.htm)

<br/>

* Structural: logic gates are expressed by complete spelling

``` Verilog
module half_str(s,c,a,b);
    input a,b;
    output s,c;
    xor (s,a,b);
    and (c,a,b);
endmodule
```

<br/>

* Data Flow: logic gates are expressed by logical operators

``` Verilog
module half(s,c,a,b);
    input a,b;
    output s,c;
    assign s=a^b;
    assign c=a&b;
endmodule
```

<br/>

* Behavioral: sequential algorithms and composed of 'functions', 'tasks', 'always' blocks

``` Verilog
module half(s,c,a,b);
    input a,b;
    output reg s,c; // reg = register
    always @(*)
    begin
        s = a^b;
        c = a&b;
    end
endmodule