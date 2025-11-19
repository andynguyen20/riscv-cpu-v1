`timescale 1ns / 1ps

module register_file(
    input logic clk, 
    input logic write_en3,
    input logic [4:0] addr1, addr2, addr3,
    input logic [31:0] write_data3,
    output logic [31:0] read_data1, read_data2
    );
    
    logic [31:0] reg_file [31:0];
    
    always_ff @(posedge clk) begin 
        if(write_en3) 
            reg_file[addr3] <= write_data3;
    end
    
    assign read_data1 = (addr1 != 5'b00000) ? reg_file[addr1] : {32{1'b0}};
    assign read_data2 = (addr2 != 5'b00000) ? reg_file[addr2] : {32{1'b0}};

endmodule