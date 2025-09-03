module top_module(
    input in,
   // input clk,reset,
    input [1:0] state,
    output [1:0] next_state,
    output out); 

    parameter A=0, B=1, C=2, D=3;
    
    
        always @ (*)begin
            case(state)
                A:next_state=(in==1)?B:A;
                B:next_state=(in==1)?B:C;
                C:next_state=(in==1)?D:A;
                D:next_state=(in==1)?B:C;
            endcase
        end
    assign out=(state==D);
    
 endmodule
