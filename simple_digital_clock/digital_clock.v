`timescale 1ms/1ms

module digital_clock(
    input clk,
    input resetn,
    output reg [7:0] sec,
    output reg [7:0] minute,
    output reg [7:0] hour
);

always @(posedge clk, negedge resetn)
begin
    if(!resetn)
    begin
        sec <= 0;
        minute <= 0;
        hour <= 0;
    end
    else
    begin
        if(sec == 59)
        begin
            sec<=0;
            if(minute==59)
            begin
                minute<=0;
                if(hour == 23)
                begin
                    hour <=0;
                end
                else
                begin
                    hour <=hour + 1;
                end
            end
            else
            begin
                minute<=minute+1;
            end
        end
        else
        begin
           sec <= sec + 1;             
        end
    end
    
end

endmodule