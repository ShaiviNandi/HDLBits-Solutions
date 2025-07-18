module top_module (
    input [7:0] in,
    output [31:0] out
);

    // Declare a temporary wire for the replicated sign bit
    wire [23:0] sign_extend_bits; 

    // Replicate the sign bit
    assign sign_extend_bits = {24{in[7]}};

    // Concatenate the replicated sign bits with the input
    assign out = {sign_extend_bits, in};

endmodule