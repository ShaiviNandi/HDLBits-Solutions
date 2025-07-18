module top_module ( input clk, input d, output q );
    wire int1, int2;
    
    my_dff dff1(.clk(clk), .d(d), .q(int1));
    my_dff dff2(.clk(clk), .d(int1), .q(int2));
    my_dff dff3(.clk(clk), .d(int2), .q(q));

endmodule