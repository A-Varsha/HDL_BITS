module top_module(
    input clk,
    input in,
    input areset,
    output out); //
    reg [1:0]state,next_state;
    parameter A=0,B=1,C=2,D=3;
    always @ (posedge clk or posedge areset)begin
        if(areset)begin
            state<=A;
            end else
                state<=next_state;
    end
    always@(*)begin
        case(state)
            A:next_state=(in==1)?B:A;
            B:next_state=(in==1)?B:C;
            C:next_state=(in==1)?D:A;
            D:next_state=(in==1)?B:C;
        endcase
    end
    assign out=(state==D);
endmodule
