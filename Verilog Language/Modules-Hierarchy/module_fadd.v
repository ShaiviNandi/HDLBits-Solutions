module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//
        
    wire [15:0] int1, int2, c1, c2;
    add16 res1(.a(a[15:0]), .b(b[15:0]), .cin(1'b0), .sum(int1), .cout(c1));
    add16 res2(.a(a[31:16]), .b(b[31:16]),.cin(c1), .sum(int2), .cout(c2));
    
    assign sum = {int2, int1};

endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );
    assign cout = a&b | a&cin | b&cin;
    assign sum = a ^ b ^ cin;

endmodule
