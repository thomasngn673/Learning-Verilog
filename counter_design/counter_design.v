/* Specifications:
    - 4 bit up-counter
    - Active high, synchronous reset
    - Active high enable
*/

module counter (
    clock,
    reset, // active high, synchronous reset INPUT
    enable, // active high enable
    counter_out // 4-bit vector output
);

input clock, reset, enable;
output [3:0] counter_output;

wire clock, reset, enable;
reg [3:0] counter_out;

always @ (posedge clock)
begin: counter
    // Check if RESET is active at every rising clock edge
    // If RESET is active, counter outputs 4'b0000 (4-bit number 0000)
    if (reset == 1'b1) begin
        counter_out <= #1 4'b0000;
        // <= is non-blocking, used in sequential logic, and occurs in parallel
        // = is blocking, used in combinational logic, and occurs sequentially
    end

    // If ENABLE is active, increment the counter
    else if (enable == 1'b1) begin
        counter_out <= #1 counter_out + 1
    end
end
endmodule