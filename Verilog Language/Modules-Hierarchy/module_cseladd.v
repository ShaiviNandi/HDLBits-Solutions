module mux(
    input sel,
    input [15:0] m1,
    input [15:0] m2,
    output [15:0] y
);
	always @* begin
        case (sel)
            1'b0: y = m1;
            1'b1: y = m2;
        endcase
    end
endmodule

module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0] int1, int2, int3, resint;
    wire c1, c2, c3;
    add16 adder1 (.a(a[15:0]), .b(b[15:0]), .cin(1'b0),.sum(int1), .cout(c1));
    add16 adder2 (.a(a[31:16]), .b(b[31:16]), .cin(1'b0), .sum(int2), .cout(c2));
    add16 adder3 (.a(a[31:16]), .b(b[31:16]), .cin(1'b1), .sum(int3), .cout(c3));
    
    mux mux1 (.sel(c1), .m1(int2), .m2(int3), .y(resint));
    
    assign sum = {resint, int1};
        
    

endmodule
