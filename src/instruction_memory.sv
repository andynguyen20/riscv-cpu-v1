`timescale 1ns / 1ps

module instruction_memory(
    input logic [31:0] addr,
    output logic [31:0] read_data
    );
    
    logic [31:0] instruction_mem [63:0];
    
    initial begin
        $readmemb("instruction.mem", instruction_mem);
    end 
    
    assign read_data = instruction_mem[addr[31:2]]; // byte addressing
    
endmodule
