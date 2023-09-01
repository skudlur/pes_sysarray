`timescale 1ns / 1ps

module pes_sysarray_tb();

    // Parameters
    parameter ARRAY_SIZE = 8;
    parameter SRAM_DATA_WIDTH = 32;
    parameter DATA_WIDTH = 8;

    // Inputs
    reg clk;
    reg srstn;
    reg alu_start;
    reg [8:0] cycle_num;
    reg [SRAM_DATA_WIDTH-1:0] sram_rdata_w0;
    reg [SRAM_DATA_WIDTH-1:0] sram_rdata_w1;
    reg [SRAM_DATA_WIDTH-1:0] sram_rdata_d0;
    reg [SRAM_DATA_WIDTH-1:0] sram_rdata_d1;
    reg [5:0] matrix_index;

    // Outputs
    wire signed [(ARRAY_SIZE*(DATA_WIDTH+DATA_WIDTH+5))-1:0] mul_outcome;

    // Instantiate the systolic array module
    pes_sysarray #(
        .ARRAY_SIZE(ARRAY_SIZE),
        .SRAM_DATA_WIDTH(SRAM_DATA_WIDTH),
        .DATA_WIDTH(DATA_WIDTH)
    ) uut (
        .clk(clk),
        .srstn(srstn),
        .alu_start(alu_start),
        .cycle_num(cycle_num),
        .sram_rdata_w0(sram_rdata_w0),
        .sram_rdata_w1(sram_rdata_w1),
        .sram_rdata_d0(sram_rdata_d0),
        .sram_rdata_d1(sram_rdata_d1),
        .matrix_index(matrix_index),
        .mul_outcome(mul_outcome)
    );

    // Clock generation
    always begin
        clk = ~clk;
        #5; // Assuming a 10ns clock period
    end

    // Test case
    initial begin
        // Initialize inputs
        clk = 0;
        srstn = 0;
        alu_start = 0;
        cycle_num = 0;
        sram_rdata_w0 = 0;
        sram_rdata_w1 = 0;
        sram_rdata_d0 = 0;
        sram_rdata_d1 = 0;
        matrix_index = 0;

        // Release reset
        srstn = 1;

        // Enable ALU
        alu_start = 1;

        // Apply your test vectors here
        // Example:
        // sram_rdata_w0 = 32'hAABBCCDD;
        // sram_rdata_w1 = 32'hEEFF0011;
        // sram_rdata_d0 = 32'h11223344;
        // sram_rdata_d1 = 32'h55667788;
        // matrix_index = 5;

        // Add appropriate delays to test your design over time

        // Monitor the output
        $monitor("mul_outcome = %h", mul_outcome);
        
        // Run the simulation for a few clock cycles
        #1000;

        // End the simulation
        $finish;
    end

endmodule
