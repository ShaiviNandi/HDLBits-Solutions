module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire [31:0] bsub;
    wire [15:0] int1, int2;
    wire c1, c2;
    
    assign bsub = b ^ {32{sub}};
    
    add16 adder (.a(a[15:0]), .b(bsub[15:0]), .cin(sub), .sum(int1), .cout(c1));
    add16 subber (.a(a[31:16]), .b(bsub[31:16]), .cin(c1), .sum(int2), .cout(c2));
    
    assign sum = {int2, int1};

endmodule
