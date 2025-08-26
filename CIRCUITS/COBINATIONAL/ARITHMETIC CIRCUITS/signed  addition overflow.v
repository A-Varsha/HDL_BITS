module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
); //
  wire cout;
    
    assign {cout,s} = {a[7],a} + {b[7],b};
        assign overflow = cout^s[7];

endmodule
