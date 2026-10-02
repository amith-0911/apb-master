`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.10.2026 02:23:20
// Design Name: 
// Module Name: APB_tb
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


module APB_Master_tb();

reg clk, reset_n;

wire pselx;
wire enable;
wire [31:0] paddr;
wire [31:0] pwdata;
wire pwrite;

reg pready;
reg transfer;
reg [31:0] addr;
reg [31:0] wdata;
reg write;

apb_master dut (clk, reset_n, transfer, addr,write,pselx,penable,paddr,pwdata,pwrite,pready);

initial begin
    {clk,transfer,addr,wdata,write}=0;
   end

always #5 clk=~clk;

initial begin
    reset_n=0;
    transfer=0;
    addr=0;
    wdata=0;
    write=1;
    pready=0;
    #20;
    reset_n=1;
    
    @(posedge clk);
    transfer=1;
    addr=32'habcd_1234;
    wdata=32'hfedc_abcd;
    arutw=1;
    @(posedge clk);
        transfer=0;
    repeat(3)
        @(posedge clk);
        pready=1;
        @(posedge clk);
        pready=0;
        
    #50;
    $finish;
end
endmodule
