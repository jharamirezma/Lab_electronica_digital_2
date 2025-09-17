`include "semaforo_fsm.v"
`timescale 1ns/1ps

module test_semaforo();


    reg clk;
    reg rst;

    semaforo #(500, 750, 100)uut(
        .clk(clk),
        .rst(rst)
    );

    always #10 clk = ~clk;

    initial begin
        clk = 0;
        rst = 0;
        #10;
        rst = 1;
        #10;
        rst = 0;
    end

    initial begin:TEST_CASE
        $dumpfile("test_semaforo.vcd");
        $dumpvars(-1, uut);
        #1000 $finish;
    end

endmodule
