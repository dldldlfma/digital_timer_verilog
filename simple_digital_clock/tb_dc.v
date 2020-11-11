module tb_dc();


reg clk;
reg rstn;

wire [7:0] sec;
wire [7:0] min;
wire [7:0] hour;


digital_clock u0(
    .clk(clk),
    .resetn(rstn),
    .sec(sec),
    .minute(min),
    .hour(hour)
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
