`timescale 1ns / 1ps

module datapath(
    input logic clk, reset,
    input logic [1:0] result_src,
    input logic pc_src, alu_src,
    input logic reg_write,
    input logic [1:0] imm_src,
    input logic [2:0] alu_control,
    input logic [31:0] instr,
    input logic [31:0] read_data,
    output logic zero,
    output logic [31:0] pc,
    output logic [31:0] alu_result, write_data
    );
    
    logic [31:0] pc_next, pc_plus4, pc_target;
    logic [31:0] imm_ext;
    logic [31:0] src_A, src_B;
    logic [31:0] result;
    
    dff pcreg(.clk(clk), .reset(reset), .d(pc_next), .q(pc));
    adder pcadd4(.a(pc), .b(32'd4), .y(pc_plus4));
    adder pcaddbranch(.a(pc), .b(imm_ext), .y(pc_target));
    mux2 pcmux(.d0(pc_plus4), .d1(pc_target), .sel(pc_src), .y(pc_next));
    
    register_file rf(.clk(clk), .write_en3(reg_write), .addr1(instr[19:15]), .addr2(instr[24:20]), .addr3(instr[11:7]), .write_data3(result), 
    .read_data1(src_A), .read_data2(write_data));
    extend ext(.instr(instr[31:7]), .imm_src(imm_src), .imm_ext(imm_ext));
    
    mux2 srcbmux(.d0(write_data), .d1(imm_ext), .sel(alu_src), .y(src_B));
    alu alu(.a(src_A), .b(src_B), .alu_control(alu_control), .alu_result(alu_result), .zero(zero));
    mux3 resultmux(.d0(alu_result), .d1(read_data), .d2(pc_plus4), .sel(result_src), .y(result));
    
    
endmodule