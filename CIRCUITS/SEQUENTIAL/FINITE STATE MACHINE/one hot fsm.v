module top_module(
    input in,
    input [9:0] state,
    output [9:0] next_state,
    output out1,
    output out2);

    localparam s0=0,s1=1,s2=2,s3=3,s4=4,
               s5=5,s6=6,s7=7,s8=8,s9=9;
    
    assign next_state[s0]=(state[0]& !in)|(state[1]& !in)|(state[2]& !in)|(state[3]& !in)|
                          (state[4]& !in)|(state[7]& !in)|(state[8]& !in)|(state[9]& !in);
    assign next_state[s1]=(state[0]&in)|(state[8]&in)|(state[9]&in);
    assign next_state[s2]=(state[1]&in);
    assign next_state[s3]=(state[2]&in);
    assign next_state[s4]=(state[3]&in);
    assign next_state[s5]=(state[4]&in);
    assign next_state[s6]=(state[5]&in);
    assign next_state[s7]=(state[6]&in)|(state[7]&in);
    assign next_state[s8]=(state[5]&!in);
    assign next_state[s9]=(state[6]&!in);
        
    
    
    assign out1=state[8]|state[9];
    assign out2=state[7]|state[9];
    
    
    endmodule
