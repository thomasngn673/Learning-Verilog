`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:09:56 01/06/2021 
// Design Name: 
// Module Name:    threeInputOrGate 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module threeInputOrGate(
    input i1,
    input i2,
    input i3,
    output gateOutput
    );

or(gateOutput, i1, i2, i3);

endmodule
