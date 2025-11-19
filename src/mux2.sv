`timescale 1ns / 1ps

module mux2(
    input logic [31:0] d0, d1,
    input logic sel,
    output logic [31:0] y
    );
    
    always_comb begin
        case(sel)
            1'b0: y = d0;
            1'b1: y = d1;
        endcase
    end
    
endmodule