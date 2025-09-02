module top_module (
    input a, 
    input b,
    input c,
    output out);//
 wire ou_t;
    assign out = ~ou_t;
    andgate inst0(ou_t ,a,b,c,1,1);
    

endmodule
