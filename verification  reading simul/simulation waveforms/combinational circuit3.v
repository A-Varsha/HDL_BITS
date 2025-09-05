module top_module (
    input a,
    input b,
    input c,
    input d,
    output q );

    assign q =(d&b)|(b&c)|(a&d)|(a&c); 

endmodule
