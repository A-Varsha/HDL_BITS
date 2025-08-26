module top_module( 
    input [99:0] a, b,
    input cin,
    output cout,
    output [99:0] sum );
    
    wire [99:0] c;
   
    FA fa[99:0] (.a(a),.b(b),.cin({c[98:0],cin}),.s(sum),.cout(c));
    assign  cout =c[99];
endmodule
module  FA(a,b,cin,s,cout);
     input a,b,cin;
     output s,cout;
     assign cout = (a&b)|(b&cin)|(cin&a);
     assign s = a^b^cin;
endmodule
