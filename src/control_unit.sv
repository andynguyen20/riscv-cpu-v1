`timescale 1ns / 1ps

module control_unit(
    input logic [6:0] op,
    input logic [2:0] funct3,
    input logic funct7b5,
    input logic zero,
    output logic [1:0] result_src,
    output logic mem_write,
    output logic pc_src,
    output logic alu_src,
    output logic reg_write,
    output logic jump,
    output logic [1:0] imm_src,
    output logic [2:0] alu_control
    );
    
   logic [1:0] alu_op;
   logic branch; 
   
   main_decoder md(.op(op), .result_src(result_src), .mem_write(mem_write), .branch(branch),
    .alu_src(alu_src), .reg_write(reg_write), .jump(jump), .imm_src(imm_src), .alu_op(alu_op));
    
   alu_decoder ad(.opb5(op[5]), .funct3(funct3), .funct7b5(funct7b5), .alu_op(alu_op), .alu_control(alu_control));
   
   assign pc_src = branch & zero | jump;
    
endmodule
