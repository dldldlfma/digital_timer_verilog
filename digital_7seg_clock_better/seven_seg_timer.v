module seven_seg_timer(
    input clk,
    input resetn,
    output [7:0] sec0,
    output [7:0] sec1,
    output [7:0] min0,
    output [7:0] min1,
    output [7:0] hour0,
    output [7:0] hour1
);

reg [3:0] s_0;
reg [3:0] s_1;
reg [3:0] m_0;
reg [3:0] m_1;
reg [3:0] h_0;
reg [3:0] h_1;

seven_seg_mux u_s0(.val(s_0), .seg_val(sec0));
seven_seg_mux u_m0(.val(m_0), .seg_val(min0));
seven_seg_mux u_h0(.val(h_0), .seg_val(hour0));
seven_seg_mux u_s1(.val(s_1), .seg_val(sec1));
seven_seg_mux u_m1(.val(m_1), .seg_val(min1));
seven_seg_mux u_h1(.val(h_1), .seg_val(hour1));


always @(posedge clk, negedge resetn)
begin
    if(!resetn)
    begin
        s_0 <=0;
        s_1 <=0;
        m_0 <=0;
        m_1 <=0;
        h_0 <=0;
        h_1 <=0;
    end
    else
    begin
        if(s_0 == 9)
        begin
            s_0 <=0;
            if(s_1 == 5)
            begin
                s_1 <=0;
                if(m_0 == 9)
                begin
                    m_0 <=0;
                    if(m_1 == 5)
                    begin
                        m_1<=0;
                        if(h_1 < 2)
                        begin
                            if(h_0 == 9)
                            begin
                                h_0<=0;
                                h_1<=h_1+1;
                            end
                            else
                            begin
                                h_0<=h_0+1;
                            end
                        end
                        else if(h_1 ==2)
                        begin
                            if(h_0==3)
                            begin
                                h_0<=0;
                                h_1<=0;
                            end
                            else
                            begin
                                h_0<=h_0+1;
                            end
                        end
                    end
                    else
                    begin
                        m_1<=m_1+1;
                    end
                end
                else
                begin
                    m_0<=m_0+1;
                end
            end
            else
            begin
                s_1<=s_1+1;
            end
        end
        else
        begin
            s_0 <= s_0 +1;
        end
    end
end



endmodule




