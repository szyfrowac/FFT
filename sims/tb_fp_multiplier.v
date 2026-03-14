`timescale 1ns / 1ps

module tb_top_fp_multiplier();

    // Inputs
    reg clk;
    reg [31:0] float_in_a;
    reg [31:0] float_in_b;

    // Outputs
    wire [31:0] float_out;

    // Instantiate the Unit Under Test (UUT)
    top_fp_multiplier uut (
        .clk(clk),
        .float_in_a(float_in_a),
        .float_in_b(float_in_b),
        .float_out(float_out)
    );

    // 100MHz Clock Generation (10ns period)
    always #5 clk = ~clk;

    initial begin
        // Initialize Inputs
        clk = 0;
        float_in_a = 0;
        float_in_b = 0;

        // Wait for global routing and initialization
        #20;

        // --------------------------------------------------------
        // Test Case 1: 1.0 * 1.0 = 1.0
        // IEEE-754: 3F800000 * 3F800000 = 3F800000
        // --------------------------------------------------------
        float_in_a = 32'h3F800000;
        float_in_b = 32'h3F800000;
        
        // Wait enough clock cycles for the pipeline to flush
        // (InputIEEE = 0, FPMult = ~4, OutputIEEE = 0)
        
        #20; // Read slightly after the clock edge
        $display("Time: %0t | 1.0 * 1.0 = %h (Expected: 3f800000)", $time, float_out);

        // --------------------------------------------------------
        // Test Case 2: 2.0 * 3.0 = 6.0
        // IEEE-754: 40000000 * 40400000 = 40C00000
        // --------------------------------------------------------
        float_in_a = 32'h40000000;
        float_in_b = 32'h40400000;
        #20;
        $display("Time: %0t | 2.0 * 3.0 = %h (Expected: 40c00000)", $time, float_out);

        // --------------------------------------------------------
        // Test Case 3: -1.5 * 2.0 = -3.0
        // IEEE-754: BFC00000 * 40000000 = C0400000
        // --------------------------------------------------------
        float_in_a = 32'hBFC00000;
        float_in_b = 32'h40000000;
        #20;
        $display("Time: %0t | -1.5 * 2.0 = %h (Expected: c0400000)", $time, float_out);

        // --------------------------------------------------------
        // Test Case 4: 0.0 * 5.0 = 0.0 (Testing Zero Exception)
        // IEEE-754: 00000000 * 40A00000 = 00000000
        // --------------------------------------------------------
        float_in_a = 32'h00000000;
        float_in_b = 32'h40A00000;
        #20;
        $display("Time: %0t | 0.0 * 5.0 = %h (Expected: 00000000)", $time, float_out);

        #50;
        $display("Simulation Complete.");
        $finish; // Stop the Vivado simulator gracefully
    end

endmodule