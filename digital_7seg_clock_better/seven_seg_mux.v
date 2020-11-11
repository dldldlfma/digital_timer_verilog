module seven_seg_mux (
    input  [3:0] val,
    output [7:0] seg_val
);


assign seg_val = (val == 4'b0000) ? 7'h40 :
                 (val == 4'b0001) ? 7'h79 :
                 (val == 4'b0010) ? 7'h24 :
                 (val == 4'b0011) ? 7'h30 :
                 (val == 4'b0100) ? 7'h19 :
                 (val == 4'b0101) ? 7'h12 :
                 (val == 4'b0110) ? 7'h02 :
                 (val == 4'b0111) ? 7'h78 :
                 (val == 4'b1000) ? 7'h00 :
                 (val == 4'b1001) ? 7'h18 :
                 (val == 4'b1010) ? 7'h08 :
                 (val == 4'b1011) ? 7'h03 :
                 (val == 4'b1100) ? 7'h46 :
                 (val == 4'b1101) ? 7'h21 :
                 (val == 4'b1110) ? 7'h06 :
                 (val == 4'b1111) ? 7'h0E : 7'h7f;
    
endmodule