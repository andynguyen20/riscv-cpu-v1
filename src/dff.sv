`timescale 1ns / 1ps

module dff(
    input logic clk, 
    input logic reset,
    input logic [31:0] d,
    output logic [31:0] q
    );
    
    always_ff @(posedge(clk), posedge(reset)) begin
        if(reset)
            q <= {32{1'b0}};
        else 
            q <= d;
    end     
    
endmodule