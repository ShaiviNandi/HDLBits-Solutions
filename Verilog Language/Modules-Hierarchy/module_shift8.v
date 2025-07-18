module mux(
    input sel1,
    input sel2,
    input [7:0] m1,
    input [7:0] m2,
    input [7:0] m3,
    input [7:0] m4,
    output [7:0] out
);
    always @* begin
        if (~sel2 && ~sel1) begin
            out = m1;
        end else if (~sel2 && sel1) begin
            out = m2;
        end else if (sel2 && ~sel1) begin
            out = m3;
        end else if (sel2 && sel1) begin
            out = m4;
        end
    end
endmodule
    

module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
    wire [7:0] int1, int2, int3;
    
    my_dff8 dff1(.clk(clk), .d(d), .q(int1));
    my_dff8 dff2(.clk(clk), .d(int1), .q(int2));
    my_dff8 dff3(.clk(clk), .d(int2), .q(int3));
    
    mux mux1(.sel1(sel[0]), .sel2(sel[1]), .m1(d), .m2(int1), .m3(int2), .m4(int3), .out(q));
    

endmodule
