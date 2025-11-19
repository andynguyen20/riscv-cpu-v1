`timescale 1ns / 1ps

module adder_tb;

    logic [31:0] a;
    logic [31:0] b;
    logic [31:0] y;
    
    adder dut(
        .a(a), 
        .b(b), 
        .y(y));
    
    initial begin
        a = 32'd34;
        b = 32'd76;
        
        #10;
        
        a = 32'd90;
        b = 32'd84;
        
        #10;
        $finish;
     end

endmodule