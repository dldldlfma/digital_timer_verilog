module seven_seg_mux (
    input  [3:0] val,
    output reg [7:0] seg_val
);

always @(val)
begin
    case (val)
        4'b0000 : seg_val = 7'h40;
        4'b0001 : seg_val = 7'h79;
        4'b0010 : seg_val = 7'h24;
        4'b0011 : seg_val = 7'h30;
        4'b0100 : seg_val = 7'h19;
        4'b0101 : seg_val = 7'h12;
        4'b0110 : seg_val = 7'h02;
        4'b0111 : seg_val = 7'h78;
        4'b1000 : seg_val = 7'h00;
        4'b1001 : seg_val = 7'h18;
        4'b1010 : seg_val = 7'h08;
        4'b1011 : seg_val = 7'h03;
        4'b1100 : seg_val = 7'h46;
        4'b1101 : seg_val = 7'h21;
        4'b1110 : seg_val = 7'h06;
        4'b1111 : seg_val = 7'h0E;
    endcase
end
    
endmodule