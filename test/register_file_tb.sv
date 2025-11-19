`timescale 1ns / 1ps

module register_file_tb;

    logic clk;
    logic [4:0] addr1;
    logic [4:0] addr2;
    logic [4:0] addr3;
    logic write_en3;
    logic [31:0] write_data3;
    logic [31:0] read_data1;
    logic [31:0] read_data2;
    
    register_file dut ( 
        .clk(clk), 
        .addr1(addr1), 
        .addr2(addr2), 
        .addr3(addr3), 
        .write_en3(write_en3), 
        .write_data3(write_data3),
        .read_data1(read_data1), 
        .read_data2(read_data2));
    
    initial clk = 1'b0;
    always #5 clk = ~clk;
    
    initial begin
        addr3 = 32'd1;
        write_data3 = 32'd190;
        write_en3 = 1'b1;
        #10;
        
        write_en3 = 1'b0;
        addr1 = 32'd1;
        #10;
        
        addr3 = 32'd2;
        write_data3 = 32'd450;
        write_en3 = 1'b1;
        #10;
        
        write_en3 = 1'b0;
        addr2 = 32'd2;
        #10;
        
        addr3 = 32'd1;
        write_data3 = 32'd0;
        write_en3 = 1'b1;
        #10;
        
        $finish;
     end

endmodule