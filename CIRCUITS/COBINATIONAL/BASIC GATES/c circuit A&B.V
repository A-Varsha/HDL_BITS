module top_module (input x, input y, output z);
    wire [3:0] z_tmp;
    A IA1(.x(x),.y(y),.z(z_tmp[0]));
    A IA2(.x(x),.y(y),.z(z_tmp[2]));
    B IB1(.x(x),.y(y),.z(z_tmp[1]));
    B IB2(.x(x),.y(y),.z(z_tmp[3]));
    
    assign  z =(z_tmp [ 0] | z_tmp[1] ) ^ (z_tmp[2] & z_tmp[3]);
endmodule
    module A (input x, input y, output z);
    assign  z = (x^y) & x;
    endmodule
    module B ( input x, input y, output z );
        assign z=!(x^y);
endmodule
