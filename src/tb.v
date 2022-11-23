`default_nettype none
`timescale 1ns/1ps

/*
this testbench just instantiates the module and makes some convenient wires
that can be driven / tested by the cocotb test.py
*/

module tb (
    // testbench is controlled by test.py
    input clk,
    input rst,
    input din,
    input [4:0] gpi;
    output cs,
    output dout,
    output [5:0] gpo
   );

    // this part dumps the trace to a vcd file that can be viewed with GTKWave
    initial begin
        $dumpfile ("tb.vcd");
        $dumpvars (0, tb);
        #1;
    end

    // wire up the inputs and outputs
    wire [7:0] inputs = {5'b0, din, rst, clk};
    wire [7:0] outputs;
    assign cs = output[0];
    assign dout = output[1];
    assign gpo = outputs[7:2];

    // instantiate the DUT
    sfsm steieio_sfsm_top(
        .io_in  (inputs),
        .io_out (outputs)
        );

endmodule
