`timescale 1ns / 1ps

module alu_tb;

    logic [31:0] a;
    logic [31:0] b;
    logic [3:0] alu_control;
    logic [31:0] alu_result;
    logic zero;
    
    alu dut(.a(a), .b(b), .alu_control(alu_control), .alu_result(alu_result), .zero(zero));
    
    initial begin
        a = 32'b00000000000000001111000010101110;
        b = 32'b00000000000000000000111110100001;
        #10;
        
        alu_control = 4'b0000;
        #10;
        
        alu_control = 4'b0001;
        #10;
            
        alu_control = 4'b0010;
        #10;
            
        alu_control = 4'b0110;
        #10;
        
        alu_control = 4'b0111;
        #10;
        
        b = 32'b00000000000000001111000010101110;
        a = 32'b00000000000000000000111110100001;
        #10;
        
        $finish;
    end
endmodule