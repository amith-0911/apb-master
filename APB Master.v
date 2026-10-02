`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.10.2026 01:42:38
// Design Name: 
// Module Name: APB Master
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module APB_Master(input clk, input reset_n, input transfer, input [31:0] addr, input [31:0] wdata, input write, output reg pselx, output reg penable, output reg [31:0] paddr, output reg [31:0] pwdata, output reg pwrite, output reg pready);

parameter idle =2'b00;
parameter setup=2'b01;
parameter access=2'b10;

reg[1:0] current_state,next_state;

//input logic
always@(posedge clk or negedge reset_n)
    begin
        if(~reset_n)
            current_state <= idle;
        else
            current_state <= next_state;
    end
    
always@(*)
    begin
        case(current_state)
            idle : begin
                if(transfer)
                    next_state=setup;
                else
                    next_state=idle;
                    end
            setup : begin
                next_state=access;
                    end
                    access : begin
                        if(pready)
                            if(transfer)
                                nest_state=setup;
                            else
                                next_state=idle;
                        else
                            next_state=access;
    endcase
    end
default : next_state=idle;
                        
//output logic            
always@(pposedge clk or negedge reset_n) 
    begin
        if(~reset_n)
            begin
                pselx<=0;
                penable<=0;
                paddr<=0;
                pwdata<=0;
                pwrite=0;
            end
        else
            begin
                case(next_state)
                    idle : begin
                        pselx<=1'b0;
                        penable<=1'b0;
            end
       setup : begin
            pselx<=1'b1;
            penable<=1'b0;
            paddr<=addr;
            pwdata<=wdata;
            pwrite<=write;
               end
       access : begin        
            pselx<=1'b1;
            penable<=1'b1;
                end
                endcase
    end
endmodule
