`timescale 1ns / 1ps

module data_memory(
    input logic clk,
    input logic write_en,
    input logic [31:0] addr, write_data, 
    output logic [31:0] read_data
    );
    
    logic [31:0] RAM [63:0];
    
    always_ff @(posedge clk) begin
        if (write_en)
            RAM[addr[31:2]] <= write_data;
    end 
    
    assign read_data = RAM[addr[31:2]];
    
endmodule