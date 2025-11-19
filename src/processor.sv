`timescale 1ns / 1ps

module processor(
    input logic clk, reset,
    input logic [31:0] instr, 
    input logic [31:0] read_data,
    output logic [31:0] pc,
    output logic mem_write,
    output logic [31:0] alu_result,
    output logic [31:0] write_data
    );
    
    logic pc_src, alu_src, reg_write, jump, zero;
    logic [1:0] result_src, imm_src;
    logic [2:0] alu_control;
    
    control_unit c(.op(instr[6:0]), .funct3(instr[14:12]), .funct7b5(instr[30]), .zero(zero), .result_src(result_src), 
    .mem_write(mem_write), .pc_src(pc_src), .alu_src(alu_src), .reg_write(reg_write), .jump(jump), .imm_src(imm_src), .alu_control(alu_control));

    datapath dp(.clk(clk), .reset(reset), .result_src(result_src), .pc_src(pc_src), .alu_src(alu_src), .reg_write(reg_write), .imm_src(imm_src), 
    .alu_control(alu_control), .zero(zero), .pc(pc), .instr(instr), .alu_result(alu_result), .write_data(write_data), .read_data(read_data));    
    
endmodule
