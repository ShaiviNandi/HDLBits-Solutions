module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
    
    wire and1;
    wire and2;
    wire and3;
    wire and4;
    
    assign and1 = p2a & p2b;
    assign and2 = p2c & p2d;
    assign and3 = p1a & p1b & p1c;
    assign and4 = p1d & p1e & p1f;
    
    
    assign p2y = and1 | and2;
    assign p1y = and3 | and4;


endmodule
