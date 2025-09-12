module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); //

    // Modify FSM and datapath from Fsm_serialdata
    parameter [2:0] idle=3'b000,start=3'b001,receive=3'b010,check=3'b011, wait_st=3'b100,stop=3'b101;
    reg [2:0]state,nx_state;
    integer i;
    reg [7:0]out;
    reg odd_reg;
    reg odd_rst;
    wire odd;
    always@(posedge clk)begin
        if(reset)
            state<=idle;
        else
            state<=nx_state;
    end
    
    always @(*)begin
        case(state)
            3'b000:nx_state=in?idle:start;
            3'b001:nx_state=receive;
            3'b010:begin
                if(i==8)begin
                  nx_state=check;
                end
                else begin
                    nx_state=receive;
                end
            end
            3'b011:nx_state=in?stop:wait_st;
            3'b100:nx_state=in?idle:wait_st;
            3'b101:nx_state=in?idle:start;
            default:nx_state=idle;
        endcase
    end
    always@(posedge clk)begin
        if(reset)begin
            i<=0;
        end
        else begin
            case(nx_state)
                3'b010:begin
                       i<=i+1;
                       end
                3'b101:begin
                       i<=0;
                       end
                default:begin
                       i<=0;
                       end
            endcase
        end
    end
     // New: Datapath to latch input bits.
    always@(posedge clk)begin
        if(reset)
            out=8'b0;
        else if(nx_state==receive)
            out[i]=in;
    end
    
    always@(posedge clk)begin
        if(reset)
            odd_reg<=0;
        else
            odd_reg<=odd;
    end
    
    always@(posedge clk)begin
        case(nx_state)
            idle:odd_rst<=1;
            stop:odd_rst<=1;
            default:odd_rst<=0;
        endcase
    end
    // New: Add parity checking.
    parity u1(.clk(clk),.in(in),.reset(reset|odd_rst),.odd(odd));
    assign done=((state==stop)&& odd_reg);
    assign out_byte=(done)?out:8'b0;  
endmodule
