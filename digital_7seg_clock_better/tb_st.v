module tb_st();

reg clk;
reg rstn;
wire [7:0] sec0;
wire [7:0] sec1;
wire [7:0] min0;
wire [7:0] min1;
wire [7:0] hour0;
wire [7:0] hour1;


seven_seg_timer u0(
    .clk(clk),
    .resetn(rstn),
    .sec0(sec0),
    .sec1(sec1),
    .min0(min0),
    .min1(min1),
    .hour0(hour0),
    .hour1(hour1)
);


always #1 clk = ~clk;

initial
begin
    clk=0;
    rstn=1;
    #1 rstn=0;
    #1 rstn=1;
    repeat (172800)
    begin
        @(posedge clk);
    end
    $finish;
end

initial
begin
   $dumpfile("test_out.vcd");
   $dumpvars(-1,u0);
end

endmodule
