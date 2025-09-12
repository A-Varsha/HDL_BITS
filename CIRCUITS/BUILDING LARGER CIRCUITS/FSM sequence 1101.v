module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output start_shifting);
    parameter [2:0] s0=3'd0,s1=3'd1,s2=3'd2,s3=3'd3,s4=3'd4;
    reg[2:0]state,next_state;
    always @ (posedge clk )begin
        if(reset )
            state<=s0;
            else
                state<=next_state;
        end
    always @ (*)begin
        //next_state=s0;
        case(state)
             3'd0:next_state=data?s1:s0;
             3'd1:next_state=data?s2:s0;
             3'd2:next_state=data?s2:s3;
             3'd3:next_state=data?s4:s0;
             3'd4:next_state=s4;
            //default :next_state=3'd0;
        endcase
    end
    
    assign  start_shifting = (state==s4);
    

endmodule
