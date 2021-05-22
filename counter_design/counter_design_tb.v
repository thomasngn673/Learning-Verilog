`include "counter_design.v"
module counter_design_tb();

// Declare inputs as regs & outputs as wires
reg clock, reset, enable;
wire [3:0] counter_out;

// Initialize variables
initial 
begin
    // Dump/create file for GTKWave to use
    $dumpfile("counter_design_tb.vcd");
    $dumpvars(0, counter_design_tb);

    $display ("Time\t Clock\t Reset\t Enable\t Counter\t");
    $monitor ("%g\t %b\t %b\t %b\t %b\t",
              $time, clock, reset, enable, counter_out);
    clock = 1;
    reset = 0;
    enable = 0;
    #5 reset = 1;
    #10 reset = 0;
    #10 enable = 1;
    #100 enable = 0;
    #5 $finish;
end

// Clock Generator
always begin
    #5 clock = ~clock; // toggle clock every 5 time units
end

// Connect DUT to test bench
counter U_counter (
    clock,
    reset,
    enable,
    counter_out
);
endmodule