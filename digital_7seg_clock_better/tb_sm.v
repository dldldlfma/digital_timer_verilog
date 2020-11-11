module tb_sm();

reg clk;
reg rstn;
reg [3:0] val;
wire [7:0] seg_val;

seven_seg_mux u0(
    .val(val),
    .seg_val(seg_val)
);


always #1 clk = ~clk;

initial
begin
    clk=0;
    rstn=1;
    #1 rstn=0;
    val=0;
    #1 rstn=1;
    repeat (10)
    begin
        @(posedge clk);
        val<=val+1;
    end
    $finish;
end

initial
begin
   $dumpfile("test_out.vcd");
   $dumpvars(-1,u0);
end

endmodule
